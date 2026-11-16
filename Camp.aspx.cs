using System;
using System.Data;
using System.Web.UI;

public partial class Camp : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetCamp();
        }
    }

    // ========================================================
    // GetCamp
    // Find the requested camp among the camps
    // currently registering and show its details
    // ========================================================
    private void GetCamp()
    {
        DataRow row = RegisteringPrograms.FindBySeason(
            RegisteringPrograms.CategoryKey("CampsCategoryKey"), Request.QueryString["season"]);

        if (row == null)
        {
            divEventInfo.Visible = false;
            lblContent.InnerHtml = "<p>This camp or class is no longer available. See the Programs page for current seasonal camps and classes.</p>";
            return;
        }

        string name = row["ProgramName"].ToString();

        litEventHeading.Text = Server.HtmlEncode(name);
        Page.Title = name + " | Burke County Recreation Department";
        divEventInfo.InnerHtml = RegisteringPrograms.GetInfoHtml(row);
        lblContent.InnerHtml = row["ProgramDescription"].ToString();
    }
}
