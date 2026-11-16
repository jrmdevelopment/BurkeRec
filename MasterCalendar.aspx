<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="MasterCalendar.aspx.cs" Inherits="MasterCalendar" Title="Calendar | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="The Burke County Recreation Department master calendar of games, practices, classes and facility reservations." />

    <!-- Telerik KendoUI -->
    <link href="https://kendo.cdn.telerik.com/2020.3.1021/styles/kendo.common.min.css" rel="stylesheet" />
    <link href="https://kendo.cdn.telerik.com/2020.3.1021/styles/kendo.default.min.css" rel="stylesheet" />

    <style>
        .calendar-legend { display: flex; flex-wrap: wrap; gap: 10px 22px; margin-bottom: 18px; font-size: .95rem; }
        .calendar-legend span { display: inline-flex; align-items: center; gap: 8px; }
        .calendar-legend i { width: 14px; height: 14px; border-radius: 3px; display: inline-block; border: 1px solid rgba(0,0,0,.15); }
        #scheduler { font-size: .9rem; }
    </style>
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Calendar</h1>
            <p>Games, practices, classes and facility reservations across Burke County Recreation. Hover over an event for details.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="calendar-legend" aria-label="Calendar legend">
                <span><i style="background:lightblue"></i>Games</span>
                <span><i style="background:orange"></i>Practices</span>
                <span><i style="background:purple"></i>Classes</span>
                <span><i style="background:yellow"></i>Reservations</span>
                <span><i style="background:lightgreen"></i>Blocked</span>
            </div>
            <div id="scheduler"></div>
        </div>
    </section>

</asp:Content>

<asp:Content ID="Scripts" ContentPlaceHolderID="ScriptContent" runat="server">

    <!-- Telerik KendoUI -->
    <script src="https://kendo.cdn.telerik.com/2020.3.1021/js/kendo.all.min.js"></script>

    <script>
        $(document).ready(function () {

            var dataSource = new kendo.data.SchedulerDataSource({
                batch: true,
                transport: {
                    read: {
                        url: 'TelerikScheduler.ashx',
                        dataType: 'json'
                    },
                    parameterMap: function (options, operation) {
                        if (operation !== "read" && options.models) {
                            return { models: kendo.stringify(options.models) };
                        }
                        if (operation === "read") {
                            return {
                                facilitySpaceKey: "0",
                                reservations: 'Individual',
                                games: 'Game',
                                practice: 'Practice',
                                blocked: 'Blocked',
                                classes: 'Classes'
                            };
                        }
                    }
                },
                schema: {
                    model: {
                        id: "ID",
                        fields: {
                            ID: { type: "number" },
                            title: { field: "Title", defaultValue: "No title", validation: { required: true } },
                            start: { type: "date", field: "StartDate" },
                            end: { type: "date", field: "EndDate" },
                            description: { field: "Description" },
                            recurrenceId: { from: "RecurrenceID" },
                            recurrenceRule: { from: "RecurrenceRule" },
                            recurrenceException: { from: "RecurrenceException" },
                            appointmentType: { field: "AppointmentType" },
                            timeRange: { field: "TimeRange" },
                            applicantName: { field: "ApplicantName" },
                            facilityName: { field: "FacilityName" },
                            isAllDay: { type: "boolean", field: "IsAllDay" }
                        }
                    }
                }
            });

            $("#scheduler").kendoScheduler({
                date: new Date(),
                editable: false,
                toolbar: ["pdf"],
                pdf: {
                    fileName: "Master-Calendar.pdf",
                    paperSize: ["10in", "8in"],
                    proxyURL: "https://demos.telerik.com/kendo-ui/service/export"
                },
                height: 650,
                timezone: "Etc/UTC",
                dataSource: dataSource,
                dataBound: function () {
                    var view = this.view();
                    var events = this.dataSource.view();

                    for (var idx = 0, length = events.length; idx < length; idx++) {
                        var event = events[idx];
                        var eventElement = view.element.find("[data-uid=" + event.uid + "]");

                        switch (event.appointmentType) {
                            case 'Class':
                            case 'Class Schedule':
                                eventElement.css({ "background-color": "purple", "color": "white" });
                                break;
                            case 'Practice':
                                eventElement.css({ "background-color": "orange", "color": "black" });
                                break;
                            case 'Game':
                                eventElement.css({ "background-color": "lightblue", "color": "black" });
                                break;
                            case 'Blocked':
                                eventElement.css({ "background-color": "lightgreen", "color": "black" });
                                break;
                            case 'Individual':
                            case 'Business':
                            case 'Nonprofit':
                            case 'LastDay':
                                eventElement.css({ "background-color": "yellow", "color": "black" });
                                break;
                        }
                    }
                },
                views: [
                    "day",
                    "week",
                    {
                        type: "month",
                        eventsPerDay: 8,
                        eventHeight: "auto",
                        eventSpacing: 5,
                        adaptiveSlotHeight: true,
                        selected: true
                    },
                    "agenda"
                ]
            });

            // The page sits inside the master page's <form>; keep any scheduler
            // buttons from posting the form back.
            $("#scheduler").on("click", "button:not([type])", function (e) {
                e.preventDefault();
            });

            $("#scheduler").kendoTooltip({
                filter: ".k-event:not(.k-event-drag-hint) > div, .k-task",
                position: "top",
                width: 250,
                content: kendo.template($('#template').html())
            });
        });
    </script>

    <script id="template" type="text/x-kendo-template">
        #var element = target.is(".k-task") ? target : target.parent();#
        #var uid = element.attr("data-uid");#
        #var scheduler = target.closest("[data-role=scheduler]").data("kendoScheduler");#
        #var model = scheduler.occurrenceByUid(uid);#

        #if(model) {#
            <strong>Type:</strong> #:model.appointmentType#<br />
            <strong>Facility:</strong> #:model.facilityName#<br />
            <strong>Date:</strong> #=kendo.format('{0:d}',model.start)#<br />
            <strong>Time:</strong> #:model.timeRange#<br />
            <strong>Applicant:</strong> #:model.applicantName#<br />
            <strong>Description:</strong> #:model.description#<br />
        #} else {#
            <strong>No event data is available</strong>
        #}#
    </script>

</asp:Content>
