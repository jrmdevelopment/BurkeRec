<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Staff.aspx.cs" Inherits="Staff" Title="Staff Directory | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Contact the staff of the Burke County Recreation Department, including directors, athletic managers, coordinators and instructors." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Staff Directory</h1>
            <p>Reach out to the team that keeps Burke County active. Click any email to get in touch directly.</p>
        </div>
    </section>

    <section class="section">
        <div class="container reveal">
            <div class="table-wrap">
                <table class="data">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Position</th>
                            <th>Contact</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptStaff" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Server.HtmlEncode((string)Eval("Name")) %></td>
                                    <td><%# Server.HtmlEncode((string)Eval("Position")) %></td>
                                    <td><%# FormatContact((string)Eval("Contact")) %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
            <p class="form-note" style="margin-top:16px;">General office line: <a href="tel:7065545210">706-554-5210</a></p>
        </div>
    </section>

</asp:Content>
