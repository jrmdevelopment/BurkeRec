<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Facilities.aspx.cs" Inherits="Facilities" Title="Facilities | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Locations, addresses and hours for Burke County Recreation Department facilities including Jonathan Broxton Park and the Citizens Park Gymnasium &amp; Soccer Complex." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Our Facilities</h1>
            <p>Find addresses, phone numbers and hours for every Burke County Recreation Department location.</p>
            <div class="hero-actions" style="margin-top:20px;">
                <a class="btn btn-primary btn-lg" href="documents/Burke_Co_Rental_Fees.pdf" target="_blank" rel="noopener">Rental Fees</a>
            </div>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="grid grid-2">

                <div class="facility reveal">
                    <div class="facility__accent--green"></div>
                    <div class="facility__body">
                        <h3>Jonathan Broxton Park Complex</h3>
                        <p class="facility__meta">465 Burke Veterans Parkway, Waynesboro, GA 30830</p>
                        <ul class="facility__list">
                            <li><span>Phone</span> <a href="tel:7065545210">706-554-5210</a></li>
                            <li><span>Office Hours</span> <span>Mon&ndash;Thurs 9:00am&ndash;5:30pm</span></li>
                            <li><span>Fridays</span> <span>By appointment</span></li>
                        </ul>
                        <p style="margin-top:14px;color:var(--muted);">Home to the department's athletic fields and administrative office. Available facilities include picnic tables, playgrounds and outdoor pickleball courts.</p>
                        <p class="mb-0"><a href="Images/BCRD-Park-Map.png" target="_blank" rel="noopener">View park map</a></p>
                    </div>
                </div>

                <div class="facility reveal">
                    <div class="facility__accent--blue"></div>
                    <div class="facility__body">
                        <h3>Citizens Park Gymnasium &amp; Soccer Complex</h3>
                        <p class="facility__meta">102 Hwy 24 South, Waynesboro, GA 30830</p>
                        <ul class="facility__list">
                            <li><span>Phone</span> <a href="tel:7065545210">706-554-5210</a></li>
                            <li><span>Alt. Phone</span> <a href="tel:7065547365">706-554-7365</a></li>
                            <li><span>Office Hours</span> <span>Mon&ndash;Thurs 1:00pm&ndash;6:00pm</span></li>
                            <li><span>Fri, Sat &amp; Sun</span> <span>Closed for programs</span></li>
                        </ul>
                        <p style="margin-top:14px;color:var(--muted);">Indoor courts for basketball, volleyball, pickleball and more. Available park facilities include soccer fields, playgrounds and outdoor basketball courts.</p>
                        <p class="mb-0"><a href="Images/Citizens-Park-.png" target="_blank" rel="noopener">View park map</a></p>
                    </div>
                </div>

                <div class="facility reveal">
                    <div class="facility__accent--gold"></div>
                    <div class="facility__body">
                        <h3>Citizens Park Tennis Facility</h3>
                        <p class="facility__meta">102 Hwy 24 South, Waynesboro, GA 30830</p>
                        <ul class="facility__list">
                            <li><span>Phone</span> <a href="tel:7065545210">706-554-5210</a></li>
                            <li><span>Activity</span> <span>Tennis programs &amp; open play</span></li>
                        </ul>
                        <p style="margin-top:14px;color:var(--muted);">Courts for lessons, leagues and recreational play.</p>
                        <p class="mb-0"><a href="Images/Citizens-Park-.png" target="_blank" rel="noopener">View park map</a></p>
                    </div>
                </div>

                <div class="facility reveal">
                    <div class="facility__accent--green"></div>
                    <div class="facility__body">
                        <h3>Gough Park</h3>
                        <p class="facility__meta">100 Broad Street, Keysville, GA 30816</p>
                        <ul class="facility__list">
                            <li><span>Phone</span> <a href="tel:7065545210">706-554-5210</a></li>
                        </ul>
                        <p class="mb-0" style="margin-top:14px;color:var(--muted);">Available facilities include outdoor basketball courts, a playground, picnic tables and a walking trail (6 laps to a mile).</p>
                    </div>
                </div>

                <div class="facility reveal">
                    <div class="facility__accent--blue"></div>
                    <div class="facility__body">
                        <h3>Battery Park at Ellison Bridge</h3>
                        <p class="facility__meta">2454 Murray-Hill Road, Sardis, GA 30456</p>
                        <ul class="facility__list">
                            <li><span>Phone</span> <a href="tel:7065545210">706-554-5210</a></li>
                        </ul>
                        <p class="mb-0" style="margin-top:14px;color:var(--muted);">Available facilities include walking trails and water access to the Savannah River.</p>
                    </div>
                </div>

                <div class="facility reveal">
                    <div class="facility__accent--gold"></div>
                    <div class="facility__body">
                        <h3>Bartlett-Sapp Park at Clark Place</h3>
                        <p class="facility__meta">131 Cunningham Avenue, Waynesboro, GA 30830</p>
                        <ul class="facility__list">
                            <li><span>Phone</span> <a href="tel:7065545210">706-554-5210</a></li>
                        </ul>
                        <p class="mb-0" style="margin-top:14px;color:var(--muted);">Available facilities include an outdoor basketball court and a playground. The park is named in honor of Ernest Bartlett and Louia &ldquo;Beaver&rdquo; Sapp, two people with a long dedication to Burke County and the Clark Place area.</p>
                    </div>
                </div>

                <div class="facility reveal">
                    <div class="facility__accent--green"></div>
                    <div class="facility__body">
                        <h3>Northview Park</h3>
                        <p class="facility__meta">228 Northview Drive, Keysville, GA 30816</p>
                        <ul class="facility__list">
                            <li><span>Phone</span> <a href="tel:7065545210">706-554-5210</a></li>
                        </ul>
                        <p class="mb-0" style="margin-top:14px;color:var(--muted);">Available facilities include an outdoor basketball court and a playground.</p>
                    </div>
                </div>

                <div class="facility reveal">
                    <div class="facility__accent--orange"></div>
                    <div class="facility__body">
                        <h3>Boxing &amp; Fitness Center <span class="badge-closed">Closed</span></h3>
                        <p class="facility__meta">525 Wallace Street, Waynesboro, GA 30830</p>
                        <ul class="facility__list">
                            <li><span>Phone</span> <a href="tel:7065545210">706-554-5210</a></li>
                            <li><span>Status</span> <span>Closed</span></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>

</asp:Content>
