<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CoachInformation.aspx.cs" Inherits="CoachInformation" Title="Coach Information | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Coach Information from the Burke County Recreation Department. Volunteer coaches are the heart of our youth programs. Find out what it takes to coach a team this season." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Coach Information</h1>
            <p>Volunteer coaches are the heart of our youth programs. Find out what it takes to coach a team this season.</p>
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
