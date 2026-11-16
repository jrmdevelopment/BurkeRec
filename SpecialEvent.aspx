<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="SpecialEvent.aspx.cs" Inherits="SpecialEvent" Title="Special Event | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Special events offered by the Burke County Recreation Department." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Special Events</h1>
            <p>A special event from the Burke County Recreation Department.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="reveal" style="max-width:760px;">
                <span class="eyebrow">Special events</span>
                <h2><asp:Literal ID="litEventHeading" runat="server" Text="Event not available" /></h2>
                <div id="divEventInfo" runat="server" class="event-info"></div>
                <div id="lblContent" runat="server" class="program-description"></div>
                <div class="hero-actions" style="margin-top:20px;">
                    <a class="btn btn-primary btn-lg" href="https://www.jarvisregister.com/default.aspx?org=burkecounty" target="_blank" rel="noopener">Register Online</a>
                    <a class="btn btn-ghost btn-lg" href="Programs.aspx">Back to Programs</a>
                </div>
                <p class="form-note" style="margin-top:14px;">Questions? Call our office at <a href="tel:7065545210">706-554-5210</a>.</p>
            </div>
        </div>
    </section>

</asp:Content>
