<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="FitnessConditioning.aspx.cs" Inherits="FitnessConditioning" Title="Fitness &amp; Body Conditioning | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Fitness &amp; Body Conditioning with the Burke County Recreation Department. Group classes designed to build strength and endurance at any level." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Fitness &amp; Body Conditioning</h1>
            <p>Group classes designed to build strength and endurance at any level.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="reveal" style="max-width:760px;">
                <span class="eyebrow">Exercise &amp; Fitness</span>
                <h2>About the program</h2>
                <div id="lblContent" runat="server"></div>
                <div class="hero-actions" style="margin-top:20px;">
                    <a class="btn btn-primary btn-lg" href="https://www.jarvisregister.com/default.aspx?org=burkecounty" target="_blank" rel="noopener">Register Online</a>
                    <a class="btn btn-ghost btn-lg" href="Programs.aspx">Back to Programs</a>
                </div>
                <p class="form-note" style="margin-top:14px;">Questions? Call our office at <a href="tel:7065545210">706-554-5210</a>.</p>
            </div>
        </div>
    </section>

</asp:Content>
