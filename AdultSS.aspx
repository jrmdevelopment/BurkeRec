<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AdultSS.aspx.cs" Inherits="AdultSS" Title="Adult Schedules &amp; Standings | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Game schedules and league standings for Burke County Recreation Department adult sports." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Adult Schedules &amp; Standings</h1>
            <p>Pick a sport, league and team to see the game schedule and current standings.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <span class="eyebrow">Adult sports</span>
            <h2><asp:Literal ID="litSportsHeader" runat="server" Text="Schedules &amp; Standings" /></h2>

            <p class="form-note"><asp:Label ID="DisplayMessage" runat="server" /></p>

            <div class="form-grid" style="max-width:1000px; grid-template-columns:repeat(auto-fit, minmax(240px, 1fr)); margin-bottom:28px;">
                <div class="field">
                    <label for="<%= ddlSport.ClientID %>">Sport</label>
                    <asp:DropDownList ID="ddlSport" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSport_SelectedIndexChanged" />
                </div>
                <div class="field">
                    <label for="<%= ddlLeague.ClientID %>">League</label>
                    <asp:DropDownList ID="ddlLeague" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLeague_SelectedIndexChanged" />
                </div>
                <div class="field">
                    <label for="<%= ddlTeam.ClientID %>">Team</label>
                    <asp:DropDownList ID="ddlTeam" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTeam_SelectedIndexChanged" />
                </div>
            </div>

            <asp:Panel ID="pnlSchedule" runat="server" Visible="false" style="margin-bottom:36px;">
                <h3><asp:Literal ID="litScheduleFor" runat="server" /></h3>
                <div class="table-wrap">
                    <asp:GridView ID="ScheduleGrid" runat="server" AutoGenerateColumns="false" CssClass="data" GridLines="None" UseAccessibleHeader="true"
                        EmptyDataText="No games have been scheduled for this team yet." OnPreRender="Grid_PreRender">
                        <Columns>
                            <asp:BoundField DataField="GameStartTime" HeaderText="Game Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="GameStartTime" HeaderText="Game Time" DataFormatString="{0:h:mm tt}" />
                            <asp:BoundField DataField="VisitorTeamName" HeaderText="Visitor" />
                            <asp:BoundField DataField="HomeTeamName" HeaderText="Home" />
                            <asp:BoundField DataField="FacilityName" HeaderText="Location" />
                            <asp:BoundField DataField="WonLoss" HeaderText="Score" />
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlStandings" runat="server" Visible="false">
                <h3>Standings</h3>
                <div class="table-wrap">
                    <asp:GridView ID="TeamGrid" runat="server" AutoGenerateColumns="false" CssClass="data" GridLines="None" UseAccessibleHeader="true"
                        EmptyDataText="Standings are not available yet." OnPreRender="Grid_PreRender">
                        <Columns>
                            <asp:BoundField DataField="TeamName" HeaderText="Team Name" />
                            <asp:BoundField DataField="NbrWon" HeaderText="Wins" />
                            <asp:BoundField DataField="NbrLost" HeaderText="Losses" />
                            <asp:BoundField DataField="PointsFor" HeaderText="Points For" />
                            <asp:BoundField DataField="PointsAgainst" HeaderText="Points Against" />
                            <asp:BoundField DataField="WLPercent" HeaderText="Pct" />
                            <asp:BoundField DataField="HeadToHead" HeaderText="HDH" />
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:Panel>

            <p class="form-note" style="margin-top:24px;">Questions? Call our office at <a href="tel:7065545210">706-554-5210</a>.</p>
        </div>
    </section>

</asp:Content>
