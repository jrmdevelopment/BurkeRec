using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;

public partial class SiteMaster : MasterPage
{
    private static readonly string[] SportPages =
    {
        "YouthBaseball.aspx", "YouthSoftball.aspx", "YouthSoccer.aspx", "YouthFootball.aspx",
        "YouthBasketball.aspx", "YouthVolleyball.aspx", "YouthTrack.aspx",
        "YouthCheerleading.aspx", "YouthFlagFootball.aspx", "YouthWrestling.aspx", "YouthTBall.aspx",
        "AdultBasketball.aspx", "AdultSoftball.aspx",
        "YouthSS.aspx", "AdultSS.aspx"
    };

    private static readonly string[] ProgramPages =
    {
        "Ceramics.aspx", "Tennis.aspx", "Karate.aspx", "Pickleball.aspx",
        "FitnessConditioning.aspx", "LunchBunch.aspx", "BoxingClub.aspx", "SpecialEvent.aspx", "Camp.aspx",
        "ESports.aspx", "HomeschoolOuting.aspx"
    };

    protected void Page_Load(object sender, EventArgs e)
    {
        HighlightActiveNav();
    }

    /// <summary>
    /// Adds the "active" CSS class to the navigation link that matches
    /// the current page so the correct tab is highlighted.
    /// </summary>
    private void HighlightActiveNav()
    {
        string current = Path.GetFileName(Request.CurrentExecutionFilePath);
        if (string.IsNullOrEmpty(current))
        {
            current = "Default.aspx";
        }

        SetActive(navHome, current, "Default.aspx");
        // Individual sport pages sit under the Sports menu.
        foreach (string page in SportPages)
        {
            SetActive(navSports, current, page);
        }
        SetActive(navAbout, current, "About.aspx");
        SetActive(navPrograms, current, "Programs.aspx");
        // Individual class, fitness, camp and special event pages sit under the Programs tab.
        foreach (string page in ProgramPages)
        {
            SetActive(navPrograms, current, page);
        }
        SetActive(navCalendar, current, "MasterCalendar.aspx");
        SetActive(navFacilities, current, "Facilities.aspx");
        // Staff has no tab of its own; it's reached from the About page.
        SetActive(navAbout, current, "Staff.aspx");
        SetActive(navContact, current, "Contact.aspx");
    }

    private void SetActive(HtmlControl link, string current, string page)
    {
        if (link != null &&
            string.Equals(current, page, StringComparison.OrdinalIgnoreCase))
        {
            string existing = link.Attributes["class"];
            link.Attributes["class"] = string.IsNullOrEmpty(existing) ? "active" : existing + " active";
        }
    }
}
