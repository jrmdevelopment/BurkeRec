<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="LunchBunch.aspx.cs" Inherits="LunchBunch" Title="Lunch Bunch Walkers | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Lunch Bunch Walkers with the Burke County Recreation Department. Join the midday walking group for a friendly, low-impact workout." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Lunch Bunch Walkers</h1>
            <p>Join the midday walking group for a friendly, low-impact workout.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="reveal" style="max-width:760px;">
                <span class="eyebrow">Exercise &amp; Fitness</span>
                <h2>About the program</h2>
                <div id="lblContent" runat="server"></div>
                <div class="hero-actions" style="margin-top:20px;">
                    <a class="btn btn-ghost btn-lg" href="Programs.aspx">Back to Programs</a>
                </div>
                <p class="form-note" style="margin-top:14px;">Questions? Call our office at <a href="tel:7065545210">706-554-5210</a>.</p>
            </div>
        </div>
    </section>

</asp:Content>
