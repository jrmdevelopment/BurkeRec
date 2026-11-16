<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Sponsorship.aspx.cs" Inherits="Sponsorship" Title="Sponsorship Opportunities | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Sponsorship Opportunities from the Burke County Recreation Department. Support local youth sports and put your business in front of the community by sponsoring a team or event." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Sponsorship Opportunities</h1>
            <p>Support local youth sports and put your business in front of the community by sponsoring a team or event.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="reveal" style="max-width:760px;">
                <span class="eyebrow">Get involved</span>
                <div id="lblContent" runat="server"></div>
                <div class="hero-actions" style="margin-top:20px;">
                    <a class="btn btn-primary btn-lg" href="Contact.aspx">Contact Us</a>
                    <a class="btn btn-ghost btn-lg" href="Default.aspx">Back to Home</a>
                </div>
                <p class="form-note" style="margin-top:14px;">Questions? Call our office at <a href="tel:7065545210">706-554-5210</a>.</p>
            </div>
        </div>
    </section>

</asp:Content>
