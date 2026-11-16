using System;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI.HtmlControls;
using SCWebsiteContent2012;

/// <summary>
/// Shared lookups for programs currently registering in a Jarvis activity
/// category (special events, camps). Used by Programs.aspx for the cards and
/// by the detail pages (SpecialEvent.aspx, Camp.aspx).
/// </summary>
public static class RegisteringPrograms
{
    /// <summary>Reads an activity category key from appSettings (e.g. "CampsCategoryKey").</summary>
    public static int CategoryKey(string settingName)
    {
        return Convert.ToInt32(ConfigurationManager.AppSettings[settingName]);
    }

    // ========================================================
    // GetRegistering
    // Get the programs currently registering in a category
    // ========================================================
    public static DataTable GetRegistering(int activityCategoryKey)
    {
        int organizationKey = Convert.ToInt32(ConfigurationManager.AppSettings["Organization"]);

        RegistrationDAL registrationDAL = new RegistrationDAL();
        return registrationDAL.GetRegisteringByActivityCategoryKey(organizationKey, activityCategoryKey);
    }

    // ========================================================
    // SetRegisterLink
    // Disable a page's Register button when nothing in its
    // category is currently registering
    // ========================================================
    public static void SetRegisterLink(HtmlAnchor registerLink, string categorySettingName)
    {
        if (GetRegistering(CategoryKey(categorySettingName)).Rows.Count > 0)
        {
            return;
        }

        DisableRegisterLink(registerLink);
    }

    // ========================================================
    // DisableRegisterLink
    // Grey out a Register button; used directly by pages that
    // already have their registering list loaded
    // ========================================================
    public static void DisableRegisterLink(HtmlAnchor registerLink)
    {
        registerLink.HRef = null;
        registerLink.Target = null;
        registerLink.Attributes["class"] += " btn-disabled";
        registerLink.Attributes["aria-disabled"] = "true";
        registerLink.Attributes["tabindex"] = "-1";
        registerLink.Attributes["title"] = "Registration is not open at this time";
    }

    // ========================================================
    // FindBySeason
    // Find one program by its SeasonKey (passed on the query
    // string); null when it is missing or no longer registering
    // ========================================================
    public static DataRow FindBySeason(int activityCategoryKey, string seasonKeyText)
    {
        int seasonKey;

        if (!int.TryParse(seasonKeyText, out seasonKey))
        {
            return null;
        }

        foreach (DataRow row in GetRegistering(activityCategoryKey).Rows)
        {
            if (Convert.ToInt32(row["SeasonKey"]) == seasonKey)
            {
                return row;
            }
        }

        return null;
    }

    // ========================================================
    // GetInfoHtml
    // One line per detail column. The *Text columns already
    // carry their own labels; when one is blank but its raw
    // column has a value (LocationText can come back empty
    // while ProgramLocation is set), label the raw value.
    // Lines with no value at all are skipped.
    // ========================================================
    public static string GetInfoHtml(DataRow row)
    {
        StringBuilder html = new StringBuilder();

        AppendInfo(html, row, "RegistrationEnd", null, null);
        AppendInfo(html, row, "ContactInformation", null, null);
        AppendInfo(html, row, "DateInformationText", "DateInformation", "Date Information");
        AppendInfo(html, row, "CostInformationText", "CostInformation", "Cost Information");
        AppendInfo(html, row, "AgeRequirementText", "AgeRequirement", "Age Requirement");
        AppendInfo(html, row, "LocationText", "ProgramLocation", "Location");

        return html.ToString();
    }

    private static void AppendInfo(StringBuilder html, DataRow row, string textColumn, string rawColumn, string label)
    {
        string value = row[textColumn].ToString().Trim();

        if (value.Length == 0 && rawColumn != null)
        {
            string raw = row[rawColumn].ToString().Trim();

            if (raw.Length > 0)
            {
                value = label + ": " + raw;
            }
        }

        if (value.Length > 0)
        {
            html.Append("<p>").Append(HttpUtility.HtmlEncode(value)).Append("</p>");
        }
    }
}
