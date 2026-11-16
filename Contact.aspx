<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" Title="Contact Us | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Contact the Burke County Recreation Department in Waynesboro, GA. Call the office, send an email or find us on the map." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Contact Us</h1>
            <p>Have a question about a program, facility or event? We'd love to hear from you.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="split">

                <!-- Contact info -->
                <div class="reveal">
                    <span class="eyebrow">Reach the department</span>
                    <h2>We're here to help</h2>
                    <ul class="info-list">
                        <li><span class="k">Main Office</span><span class="v"><a href="tel:7065545210">706-554-5210</a></span></li>
                        <li><span class="k">Citizens Park Gymnasium &amp; Soccer Complex</span><span class="v"><a href="tel:7065545210">706-554-5210</a></span></li>
                        <li><span class="k">Email</span><span class="v"><a href="mailto:burkerec@burkecounty-ga.gov">burkerec@burkecounty-ga.gov</a></span></li>
                        <li><span class="k">Office</span><span class="v">465 Burke Veterans Parkway, Waynesboro, GA 30830</span></li>
                        <li><span class="k">Mailing</span><span class="v">P.O. Box 625, Waynesboro, GA 30830</span></li>
                        <li><span class="k">Hours</span><span class="v">Mon&ndash;Thurs 9:00am&ndash;5:30pm</span></li>
                    </ul>
                </div>

                <!-- Office map -->
                <div class="reveal">
                    <div class="card">
                        <h3 class="mt-0">Visit our office</h3>
                        <p>465 Burke Veterans Parkway, Waynesboro, GA 30830</p>
                        <div class="map-embed">
                            <iframe title="Map of the Burke County Recreation Department office"
                                src="https://www.google.com/maps?q=465+Burke+Veterans+Parkway,+Waynesboro,+GA+30830&amp;output=embed"
                                loading="lazy" referrerpolicy="no-referrer-when-downgrade" allowfullscreen></iframe>
                        </div>
                        <p style="margin-top:12px;"><a href="https://www.google.com/maps/dir/?api=1&amp;destination=465+Burke+Veterans+Parkway,+Waynesboro,+GA+30830" target="_blank" rel="noopener">Get directions</a></p>
                    </div>
                </div>

            </div>
        </div>
    </section>

</asp:Content>
