<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Pickleball.aspx.cs" Inherits="Pickleball" Title="Pickleball | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Pickleball with the Burke County Recreation Department. Learn the rules, strategy and skills of one of the fastest-growing paddle sports." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Pickleball</h1>
            <p>Learn the rules, strategy and skills of one of the fastest-growing paddle sports.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="reveal" style="max-width:760px;">
                <span class="eyebrow">Classes</span>
                <div id="lblContent" runat="server"></div>

                <hr class="content-divider" />
                <h2 class="registering-heading">Currently Registering</h2>

                <!-- One section per pickleball class currently registering -->
                <asp:Repeater ID="rptClasses" runat="server">
                    <ItemTemplate>
                        <div class="class-listing">
                            <h3><%# Server.HtmlEncode(Eval("ProgramName").ToString()) %></h3>
                            <div class="event-info"><%# RegisteringPrograms.GetInfoHtml(((System.Data.DataRowView)Container.DataItem).Row) %></div>
                            <div class="program-description"><%# Eval("ProgramDescription") %></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Label ID="lblNoClasses" runat="server" CssClass="lead" Visible="false"
                    Text="There are no pickleball classes scheduled at this time. Check back soon for upcoming classes." />

                <div class="hero-actions" style="margin-top:20px;">
                    <a id="lnkRegister" runat="server" class="btn btn-primary btn-lg" href="https://www.jarvisregister.com/default.aspx?org=burkecounty" target="_blank" rel="noopener">Register Online</a>
                    <a class="btn btn-ghost btn-lg" href="Programs.aspx">Back to Programs</a>
                </div>
                <p class="form-note" style="margin-top:14px;">Questions? Call our office at <a href="tel:7065545210">706-554-5210</a>.</p>
            </div>
        </div>
    </section>

</asp:Content>
