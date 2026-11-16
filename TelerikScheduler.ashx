<%@ WebHandler Language="C#" Class="TelerikScheduler" %>

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Script.Serialization;
using SCWebsiteContent2012;

/// <summary>
/// Feeds the Kendo UI scheduler on MasterCalendar.aspx with the organization's
/// facility reservations, games, practices, blocked times and classes.
/// Ported from EllisRec TelerikScheduler.ashx.
/// </summary>
public class TelerikScheduler : IHttpHandler
{
    public class CalendarInformationBE
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string Description { get; set; }
        public object RecurrenceId { get; set; }
        public object RecurrenceRule { get; set; }
        public object RecurrenceException { get; set; }
        public bool IsAllDay { get; set; }
        public string AppointmentType { get; set; }
        public object StartTimezone { get; set; }
        public object EndTimezone { get; set; }
        public string TimeRange { get; set; }
        public string ApplicantName { get; set; }
        public string FacilityName { get; set; }
    }

    public void ProcessRequest(HttpContext context)
    {
        // Organization comes from Web.config rather than the query string.
        int organizationKey = Convert.ToInt32(ConfigurationManager.AppSettings["Organization"]);

        string facilitySpaceKey = context.Request.Params["facilitySpaceKey"];
        string reservations = context.Request.Params["reservations"];
        string games = context.Request.Params["games"];
        string practice = context.Request.Params["practice"];
        string blocked = context.Request.Params["blocked"];
        string classes = context.Request.Params["classes"];

        int intFacilitySpaceKey;
        if (!int.TryParse(facilitySpaceKey, out intFacilitySpaceKey))
        {
            intFacilitySpaceKey = 0;
        }

        FacilityReservationDAL facilityReservationDAL = new FacilityReservationDAL();
        DataTable dtReservations = facilityReservationDAL.FacilityReservationsForMasterCalendarDT(organizationKey, intFacilitySpaceKey, "N");

        List<CalendarInformationBE> calendarList = new List<CalendarInformationBE>();

        foreach (DataRow dtRow in dtReservations.Rows)
        {
            string appointmentType = Convert.ToString(dtRow["AppointmentType"]);

            bool include =
                (reservations == "Individual" && (appointmentType == "Individual" || appointmentType == "Business" || appointmentType == "Nonprofit")) ||
                (games == "Game" && appointmentType == "Game") ||
                (practice == "Practice" && appointmentType == "Practice") ||
                (blocked == "Blocked" && appointmentType == "Blocked") ||
                (classes == "Classes" && (appointmentType == "Class" || appointmentType == "Class Schedule" || appointmentType == "LastDay"));

            if (!include)
            {
                continue;
            }

            DateTime start = Convert.ToDateTime(dtRow["StartTimeOfEvent"]);
            DateTime end = Convert.ToDateTime(dtRow["EndTimeOfEvent"]);

            calendarList.Add(new CalendarInformationBE
            {
                ID = Convert.ToInt32(dtRow["FacilityReservationKey"]),
                Title = Convert.ToString(dtRow["SubjectAndFacility"]),
                StartDate = start,
                EndDate = end,
                Description = Convert.ToString(dtRow["PurposeOfUse"]),
                RecurrenceId = null,
                RecurrenceRule = null,
                RecurrenceException = null,
                IsAllDay = false,
                AppointmentType = appointmentType,
                StartTimezone = null,
                EndTimezone = null,
                TimeRange = start.ToString("h:mm t") + " - " + end.ToString("h:mm t"),
                ApplicantName = Convert.ToString(dtRow["ApplicantName"]),
                FacilityName = Convert.ToString(dtRow["FacilityName"])
            });
        }

        JavaScriptSerializer serializer = new JavaScriptSerializer();
        serializer.MaxJsonLength = int.MaxValue;

        context.Response.ContentType = "application/json";
        context.Response.Write(serializer.Serialize(calendarList));
    }

    public bool IsReusable
    {
        get { return false; }
    }
}
