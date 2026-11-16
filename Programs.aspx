<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Programs.aspx.cs" Inherits="Programs" Title="Programs &amp; Classes | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Explore programs, classes, fitness and special events offered by the Burke County Recreation Department, from ceramics, tennis, karate and pickleball classes to boxing and group fitness." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Programs &amp; Classes</h1>
            <p>Here is a list of the programs, classes and special events we currently offer. Register online to reserve your spot.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">

            <!-- Classes -->
            <div class="section-head reveal">
                <span class="eyebrow" style="color:var(--gold)">Learn something new</span>
                <h2>Classes</h2>
            </div>
            <div class="grid grid-3">
                <a class="tile tile--link reveal" href="Ceramics.aspx">
                    <div class="tile__bar tile__bar--gold"></div>
                    <div class="tile__body">
                        <h3>Ceramics Classes</h3>
                        <p>Hands-on ceramics instruction for creative minds of every age.</p>
                        <span class="tile__more">Learn more &rarr;</span>
                    </div>
                </a>
                <a class="tile tile--link reveal" href="Tennis.aspx">
                    <div class="tile__bar tile__bar--gold"></div>
                    <div class="tile__body">
                        <h3>Tennis</h3>
                        <p>Play at the Citizens Park tennis facility with programs for beginners and beyond.</p>
                        <span class="tile__more">Learn more &rarr;</span>
                    </div>
                </a>
                <a class="tile tile--link reveal" href="Karate.aspx">
                    <div class="tile__bar tile__bar--gold"></div>
                    <div class="tile__body">
                        <h3>Karate</h3>
                        <p>Build discipline, confidence and self-defense skills through martial arts instruction.</p>
                        <span class="tile__more">Learn more &rarr;</span>
                    </div>
                </a>
                <a class="tile tile--link reveal" href="Pickleball.aspx">
                    <div class="tile__bar tile__bar--gold"></div>
                    <div class="tile__body">
                        <h3>Pickleball</h3>
                        <p>Learn the rules, strategy and skills of one of the fastest-growing paddle sports.</p>
                        <span class="tile__more">Learn more &rarr;</span>
                    </div>
                </a>
                <a class="tile tile--link reveal" href="ESports.aspx">
                    <div class="tile__bar tile__bar--gold"></div>
                    <div class="tile__body">
                        <h3>ESports</h3>
                        <p>Competitive and casual video gaming in a fun, team-focused setting.</p>
                        <span class="tile__more">Learn more &rarr;</span>
                    </div>
                </a>
                <a class="tile tile--link reveal" href="HomeschoolOuting.aspx">
                    <div class="tile__bar tile__bar--gold"></div>
                    <div class="tile__body">
                        <h3>Homeschool Outing</h3>
                        <p>Recreation outings designed for homeschool families to learn, play and connect.</p>
                        <span class="tile__more">Learn more &rarr;</span>
                    </div>
                </a>
            </div>

            <!-- Fitness -->
            <div class="section-head reveal" style="margin-top:52px;">
                <span class="eyebrow" style="color:var(--blue)">Stay active</span>
                <h2>Exercise &amp; Fitness</h2>
            </div>
            <div class="grid grid-3">
                <a class="tile tile--link reveal" href="FitnessConditioning.aspx">
                    <div class="tile__bar tile__bar--blue"></div>
                    <div class="tile__body">
                        <h3>Fitness &amp; Body Conditioning</h3>
                        <p>Group classes designed to build strength and endurance at any level.</p>
                        <span class="tile__more">Learn more &rarr;</span>
                    </div>
                </a>
                <a class="tile tile--link reveal" href="LunchBunch.aspx">
                    <div class="tile__bar tile__bar--blue"></div>
                    <div class="tile__body">
                        <h3>Lunch Bunch Walkers</h3>
                        <p>Join the midday walking group for a friendly, low-impact workout.</p>
                        <span class="tile__more">Learn more &rarr;</span>
                    </div>
                </a>
                <a class="tile tile--link reveal" href="BoxingClub.aspx">
                    <div class="tile__bar tile__bar--blue"></div>
                    <div class="tile__body">
                        <h3>Burke County Boxing Club</h3>
                        <p>Training and conditioning for aspiring boxers of all experience levels.</p>
                        <span class="tile__more">Learn more &rarr;</span>
                    </div>
                </a>
            </div>

            <!-- Seasonal Camps/Classes -->
            <div class="section-head reveal" style="margin-top:52px;">
                <span class="eyebrow" style="color:var(--green)">Seasonal fun</span>
                <h2>Seasonal Camps/Classes</h2>
            </div>
            <asp:Repeater ID="rptCamps" runat="server">
                <HeaderTemplate><div class="grid grid-3"></HeaderTemplate>
                <ItemTemplate>
                    <a class="tile tile--link reveal" href="Camp.aspx?season=<%# Eval("SeasonKey") %>">
                        <div class="tile__bar tile__bar--green"></div>
                        <div class="tile__body">
                            <h3><%# Server.HtmlEncode(Eval("ProgramName").ToString()) %></h3>
                            <span class="tile__more">Learn more &rarr;</span>
                        </div>
                    </a>
                </ItemTemplate>
                <FooterTemplate></div></FooterTemplate>
            </asp:Repeater>
            <asp:Label ID="lblNoCamps" runat="server" CssClass="lead" Visible="false"
                Text="There are no seasonal camps or classes scheduled at this time. Check back soon for upcoming offerings." />

            <!-- Special Events -->
            <div class="section-head reveal" style="margin-top:52px;">
                <span class="eyebrow" style="color:var(--orange)">Mark your calendar</span>
                <h2>Special Events</h2>
            </div>
            <asp:Repeater ID="rptSpecialEvents" runat="server">
                <HeaderTemplate><div class="grid grid-3"></HeaderTemplate>
                <ItemTemplate>
                    <a class="tile tile--link reveal" href="SpecialEvent.aspx?season=<%# Eval("SeasonKey") %>">
                        <div class="tile__bar tile__bar--orange"></div>
                        <div class="tile__body">
                            <h3><%# Server.HtmlEncode(Eval("ProgramName").ToString()) %></h3>
                            <span class="tile__more">Learn more &rarr;</span>
                        </div>
                    </a>
                </ItemTemplate>
                <FooterTemplate></div></FooterTemplate>
            </asp:Repeater>
            <asp:Label ID="lblNoSpecialEvents" runat="server" CssClass="lead" Visible="false"
                Text="There are no special events scheduled at this time. Check back soon for upcoming community events." />

        </div>
    </section>

    <section class="section section--tight section--alt">
        <div class="container text-center reveal">
            <h2>See something you like?</h2>
            <p class="lead" style="margin-left:auto;margin-right:auto;">Registration is quick and easy through our new online system.</p>
            <a class="btn btn-primary btn-lg" href="Registration.aspx">Register for a program</a>
        </div>
    </section>

</asp:Content>
