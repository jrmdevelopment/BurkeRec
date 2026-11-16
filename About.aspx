<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" Title="About Us | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Learn about the mission and purpose of the Burke County Recreation Department and the leadership serving Burke County, Georgia." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>About the Department</h1>
            <p>Serving the citizens of Burke County with quality recreation programs, facilities and services.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="split">
                <div class="reveal">
                    <span class="eyebrow">Mission statement</span>
                    <h2>Recreation that serves everyone</h2>
                    <p>The Burke County Recreation Department is responsible for organizing, conducting and maintaining the highest quality of recreation services for all citizens of Burke County.</p>
                    <span class="eyebrow" style="color:var(--blue)">Our purpose</span>
                    <p>The department will continuously explore and implement new ideas and expand the knowledge of all programs, facilities and services designed to meet the demands of our constantly changing population.</p>
                </div>
                <div class="reveal">
                    <div class="card">
                        <h3>What we value</h3>
                        <ul class="info-list">
                            <li><span class="k">Community</span><span class="v">Bringing residents of every age together.</span></li>
                            <li><span class="k">Quality</span><span class="v">The highest standard in every program and facility.</span></li>
                            <li><span class="k">Growth</span><span class="v">Always exploring new ideas and offerings.</span></li>
                            <li><span class="k">Access</span><span class="v">Services designed for all citizens of Burke County.</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section section--tight">
        <div class="container text-center reveal">
            <h2>Meet the team behind it all</h2>
            <p class="lead" style="margin-left:auto;margin-right:auto;">Our staff coordinates every sport, class and event throughout the year.</p>
            <a class="btn btn-blue" href="Staff.aspx">View staff directory</a>
            <div class="logo-grid">
                <img src="Images/NRPA-Logo-300x229.png" alt="National Recreation and Park Association" />
                <img src="Images/GRPA-Logo-sm.jpg" alt="Georgia Recreation and Park Association" />
                <img src="Images/NAYS-Logo-300x158.png" alt="National Alliance for Youth Sports" />
                <img src="Images/USA-Football-logo.jpg" alt="USA Football" />
                <img src="Images/USA-Wrestling-logo.jpg" alt="USA Wrestling" />
                <img src="Images/Diamond-Youth-Baseball-Logo.png" alt="Diamond Youth Baseball" />
                <img src="Images/Diamond-Yoth-Softball-Logo-293x300.jpg" alt="Diamond Youth Softball" />
            </div>
        </div>
    </section>

    <section class="section section--alt">
        <div class="container text-center reveal">
            <span class="eyebrow">Leadership</span>
            <h2>Burke County government</h2>
            <p class="lead" style="margin-left:auto;margin-right:auto;">Find information about the County Manager and Board of Commissioners on the Burke County website.</p>
            <a class="btn btn-blue" href="http://www.burkecounty-ga.gov" target="_blank" rel="noopener">Visit Burke County government</a>
        </div>
    </section>

</asp:Content>
