<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" Title="Registration &amp; Reservations | Burke County Recreation Department" %>

<asp:Content ID="Meta" ContentPlaceHolderID="MetaContent" runat="server">
    <meta name="description" content="Register and reserve activities with the Burke County Recreation Department using our new online registration system." />
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <section class="page-hero">
        <div class="container reveal">
            <h1>Registration &amp; Reservations</h1>
            <p>We have a new registration software program. Create an account to register for your activity or reserve a facility.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div class="split">
                <div class="reveal">
                    <span class="eyebrow">Getting started</span>
                    <h2>Three simple steps</h2>
                    <ul class="info-list">
                        <li><span class="k">1. Create</span><span class="v">Set up your free account in the new registration system.</span></li>
                        <li><span class="k">2. Browse</span><span class="v">Find the program, class or event you'd like to join.</span></li>
                        <li><span class="k">3. Register</span><span class="v">Complete your registration and reserve your spot.</span></li>
                    </ul>
                    <div class="hero-actions" style="margin-top:20px;">
                        <a class="btn btn-primary btn-lg" href="https://www.jarvisregister.com/default.aspx?org=burkecounty" target="_blank" rel="noopener">Go to Registration Portal</a>
                        <a class="btn btn-ghost btn-lg" href="Programs.aspx">See Programs</a>
                    </div>
                    <p class="form-note" style="margin-top:14px;">Need help creating your account? Call our office at <a href="tel:7065545210">706-554-5210</a>.</p>
                </div>

                <div class="reveal">
                    <div class="card">
                        <h3>What you can do online</h3>
                        <ul class="tag-list" style="margin-top:0;">
                            <li>Register for sports</li>
                            <li>Sign up for classes</li>
                            <li>Reserve facilities</li>
                            <li>Enroll in events</li>
                            <li>Manage your family</li>
                            <li>View schedules</li>
                        </ul>
                        <hr style="border:0;border-top:1px solid var(--line);margin:20px 0;" />
                        <h3>Prefer to register in person?</h3>
                        <p class="mb-0">Visit the Jonathan Broxton Park office at 465 Burke Veterans Parkway, Waynesboro, GA 30830, Monday&ndash;Thursday, 9:00am&ndash;5:30pm.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
