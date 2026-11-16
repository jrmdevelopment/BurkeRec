<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="YouthFlagFootball.aspx.cs" Inherits="YouthFlagFootball" Title="Youth Flag Football | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Youth Flag Football with the Burke County Recreation Department. Fast-paced, non-contact football that teaches the basics of the game." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Youth Flag Football</h1>
            <p>Fast-paced, non-contact football that teaches the basics of the game.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="reveal" style="max-width:760px;">
                <span class="eyebrow">Youth sports</span>
                <h2>About the program</h2>
                <div id="lblContent" runat="server"></div>
                <div class="hero-actions" style="margin-top:20px;">
                    <a id="lnkRegisterGirls" runat="server" class="btn btn-primary btn-lg" href="https://www.jarvisregister.com/default.aspx?org=burkecounty" target="_blank" rel="noopener">Register &ndash; Girls</a>
                    <a id="lnkRegisterCoed" runat="server" class="btn btn-primary btn-lg" href="https://www.jarvisregister.com/default.aspx?org=burkecounty" target="_blank" rel="noopener">Register &ndash; Co-ed</a>
                    <a id="lnkSchedulesGirls" runat="server" class="btn btn-ghost btn-lg" href="YouthSS.aspx">Schedules &amp; Standings &ndash; Girls</a>
                    <a id="lnkSchedulesCoed" runat="server" class="btn btn-ghost btn-lg" href="YouthSS.aspx">Schedules &amp; Standings &ndash; Co-ed</a>
                </div>
                <p class="form-note" style="margin-top:14px;">Questions? Call our office at <a href="tel:7065545210">706-554-5210</a>.</p>
            </div>
        </div>
    </section>

</asp:Content>
