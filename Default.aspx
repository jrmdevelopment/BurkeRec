<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Burke County Recreation Department | Waynesboro, GA" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Sports, classes, special events and welcoming parks for every citizen of Burke County, Georgia. Register online with the Burke County Recreation Department." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Registration notice -->
    <div class="notice">
        <div class="container">
            <span class="badge">New</span>
            <span>We have a new registration software program. <a href="Registration.aspx">Create an account</a> to register for your activity.</span>
        </div>
    </div>

    <!-- Hero -->
    <section class="hero">
        <div class="container">
            <div class="reveal">
                <span class="eyebrow" style="color:var(--gold)">Burke County, Georgia</span>
                <h1>Play, grow and connect <span class="accent">right here at home.</span></h1>
                <p>From youth sports and fitness to ceramics, karate and community events &mdash; the Burke County Recreation Department keeps every generation active and engaged.</p>
                <div class="hero-actions">
                    <a class="btn btn-primary btn-lg" href="Registration.aspx">Register Now</a>
                    <a class="btn btn-light btn-lg" href="Programs.aspx">Browse Programs</a>
                </div>
            </div>
            <div class="hero-card reveal">
                <h3>At a glance</h3>
                <ul>
                    <li><span>Park Office Hours</span> <strong>Mon&ndash;Thurs 9&ndash;5:30</strong></li>
                    <li><span>Citizens Park Gymnasium &amp; Soccer Complex</span> <strong>Mon&ndash;Thurs 1&ndash;6</strong></li>
                    <li><span>Main Office</span> <strong>706-554-5210</strong></li>
                    <li><span>Location</span> <strong>Waynesboro, GA</strong></li>
                </ul>
            </div>
        </div>
    </section>

    <!-- Quick category tiles -->
    <section class="section">
        <div class="container">
            <div class="section-head text-center">
                <span class="eyebrow">What we offer</span>
                <h2>Something for every member of the family</h2>
                <p class="lead" style="margin-left:auto;margin-right:auto;">Explore the ways Burke County residents stay active, learn new skills and come together throughout the year.</p>
            </div>

            <div class="grid grid-4">
                <div class="tile reveal">
                    <div class="tile__bar tile__bar--green"></div>
                    <div class="tile__body">
                        <div class="tile__icon" style="background:var(--green)">AS</div>
                        <h3>Athletics &amp; Sports</h3>
                        <p>Youth baseball, softball, TBall/BATS, soccer, football, flag football, cheerleading, basketball, volleyball, track and wrestling, plus adult basketball and softball leagues.</p>
                    </div>
                </div>
                <div class="tile reveal">
                    <div class="tile__bar tile__bar--gold"></div>
                    <div class="tile__body">
                        <div class="tile__icon" style="background:var(--gold)">CL</div>
                        <h3>Classes</h3>
                        <p>Ceramics, tennis, karate and pickleball classes for all skill levels.</p>
                    </div>
                </div>
                <div class="tile reveal">
                    <div class="tile__bar tile__bar--blue"></div>
                    <div class="tile__body">
                        <div class="tile__icon" style="background:var(--blue)">FT</div>
                        <h3>Fitness</h3>
                        <p>Body conditioning classes, the Boxing Club and the Lunch Bunch Walkers keep you moving.</p>
                    </div>
                </div>
                <div class="tile reveal">
                    <div class="tile__bar tile__bar--orange"></div>
                    <div class="tile__body">
                        <div class="tile__icon" style="background:var(--orange)">SE</div>
                        <h3>Special Events</h3>
                        <p>There are no special events scheduled at this time. Check back soon for upcoming community events.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Mission split -->
    <section class="section section--alt">
        <div class="container">
            <div class="split">
                <div class="reveal">
                    <span class="eyebrow">Our mission</span>
                    <h2>Quality recreation for all citizens of Burke County</h2>
                    <p>The Burke County Recreation Department is responsible for organizing, conducting and maintaining the highest quality of recreation services for all citizens of Burke County.</p>
                    <p>We continuously explore and implement new ideas and expand the knowledge of all programs, facilities and services designed to meet the demands of our constantly changing population.</p>
                    <p>The employees of the Burke County Recreation Department are public servants and must have the ability to be creative, innovative and have the flexibility to serve the citizens twenty-four hours a day, seven days a week.</p>
                    <a class="btn btn-blue" href="About.aspx">More about us</a>
                </div>
                <div class="reveal">
                    <div class="card">
                        <div class="stats">
                            <div class="stat"><b>8</b><span>Facilities</span></div>
                            <div class="stat"><b>20+</b><span>Programs</span></div>
                            <div class="stat"><b>All</b><span>Ages welcome</span></div>
                            <div class="stat"><b>Year</b><span>Round activity</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Get involved -->
    <section class="section">
        <div class="container">
            <div class="section-head">
                <span class="eyebrow">Get involved</span>
                <h2>Coaches, parents and sponsors</h2>
            </div>
            <div class="grid grid-3">
                <a class="tile tile--link reveal" href="CoachInformation.aspx">
                    <div class="tile__bar tile__bar--green"></div>
                    <div class="tile__body">
                        <div class="tile__icon" style="background:var(--green)">CI</div>
                        <h3>Coach Information</h3>
                        <p>Volunteer coaches are the heart of our youth programs. Find out what it takes to coach a team this season.</p>
                        <span class="tile__more">Learn more &rarr;</span>
                    </div>
                </a>
                <a class="tile tile--link reveal" href="ParentInformation.aspx">
                    <div class="tile__bar tile__bar--blue"></div>
                    <div class="tile__body">
                        <div class="tile__icon" style="background:var(--blue)">PI</div>
                        <h3>Parent Information</h3>
                        <p>Everything families need to know about registration, schedules and what to expect during the season.</p>
                        <span class="tile__more">Learn more &rarr;</span>
                    </div>
                </a>
                <a class="tile tile--link reveal" href="Sponsorship.aspx">
                    <div class="tile__bar tile__bar--gold"></div>
                    <div class="tile__body">
                        <div class="tile__icon" style="background:var(--gold)">SO</div>
                        <h3>Sponsorship Opportunities</h3>
                        <p>Support local youth sports and put your business in front of the community by sponsoring a team or event.</p>
                        <span class="tile__more">Learn more &rarr;</span>
                    </div>
                </a>
            </div>
        </div>
    </section>

    <!-- Links of interest
         To add a link: replace href="#" with the web address and "Link N" with the text to show.
         target="_blank" opens the link in a new tab. Delete any <li> lines you don't need. -->
    <section class="section section--alt">
        <div class="container">
            <div class="section-head">
                <span class="eyebrow">Helpful resources</span>
                <h2>Links of Interest</h2>
            </div>
            <!-- Facebook banner (shown above the list so it stands out) -->
            <a class="fb-banner reveal" href="https://www.facebook.com/wbcrd/" target="_blank" rel="noopener">
                <span class="fb-banner__icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24" width="30" height="30" fill="currentColor"><path d="M14 8.5V6.8c0-.8.2-1.3 1.4-1.3H17V2.2C16.7 2.1 15.7 2 14.6 2 12.2 2 10.6 3.5 10.6 6.1v2.4H8V12h2.6v10H14V12h2.7l.4-3.5H14z"/></svg>
                </span>
                <span class="fb-banner__text">
                    <strong>Follow us on Facebook</strong>
                    <span>Get the latest news, schedule updates, weather cancellations and photos.</span>
                </span>
                <span class="fb-banner__btn">Visit our page &rarr;</span>
            </a>

            <ul class="link-list reveal">
                <li><a class="link-list__item" href="https://www.burkecounty-ga.gov/" target="_blank" rel="noopener">Burke County Georgia</a></li>
                <li><a class="link-list__item" href="https://grpa.org/" target="_blank" rel="noopener">Georgia Recreation &amp; Parks Association</a></li>
                <li><a class="link-list__item" href="https://www.nrpa.org/" target="_blank" rel="noopener">National Recreation &amp; Park Association</a></li>
                <li><a class="link-list__item" href="https://www.nays.org/" target="_blank" rel="noopener">National Youth Sports Coaches Association</a></li>
                <li><a class="link-list__item" href="https://www.nays.org/parents" target="_blank" rel="noopener">Parent Association of Youth Sports</a></li>
                <li><a class="link-list__item" href="https://dybusa.org/" target="_blank" rel="noopener">Diamond Youth Baseball</a></li>
                <li><a class="link-list__item" href="https://dysusa.org/" target="_blank" rel="noopener">Diamond Youth Softball</a></li>
                <li><a class="link-list__item" href="https://www.nays.org/coaches" target="_blank" rel="noopener">National Alliance for Youth Sports Coaches Certifications</a></li>
                <li><a class="link-list__item" href="https://usafootball.com/" target="_blank" rel="noopener">USA Football</a></li>
                <li><a class="link-list__item" href="https://law.georgia.gov/key-issues/human-trafficking" target="_blank" rel="noopener">Georgia Hotline for Human Trafficking</a></li>
            </ul>
        </div>
    </section>

    <!-- CTA -->
    <section class="section section--tight">
        <div class="container text-center reveal">
            <h2>Ready to get started?</h2>
            <p class="lead" style="margin-left:auto;margin-right:auto;">Create your account in the new registration system and sign up for your next activity.</p>
            <a class="btn btn-primary btn-lg" href="Registration.aspx">Create an account</a>
        </div>
    </section>

</asp:Content>
