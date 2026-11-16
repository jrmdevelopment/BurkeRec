<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AdultBasketball.aspx.cs" Inherits="AdultBasketball" Title="Adult Basketball | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Adult Basketball with the Burke County Recreation Department. Seasonal adult basketball for players who want to stay in the game." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Adult Basketball</h1>
            <p>Seasonal adult basketball for players who want to stay in the game.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="reveal" style="max-width:760px;">
                <span class="eyebrow">Adult sports</span>
                <h2>About the program</h2>
                <div id="lblContent" runat="server"></div>
                <div class="hero-actions" style="margin-top:20px;">
                    <a id="lnkRegister" runat="server" class="btn btn-primary btn-lg" href="https://www.jarvisregister.com/default.aspx?org=burkecounty" target="_blank" rel="noopener">Register Online</a>
                    <a id="lnkSchedules" runat="server" class="btn btn-ghost btn-lg" href="AdultSS.aspx">Schedules &amp; Standings</a>
                </div>
                <p class="form-note" style="margin-top:14px;">Questions? Call our office at <a href="tel:7065545210">706-554-5210</a>.</p>
            </div>
        </div>
    </section>

</asp:Content>
