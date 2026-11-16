using System;
using System.Data;
using System.Web.UI;

public partial class SpecialEvent : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetEvent();
        }
    }

    // ========================================================
    // GetEvent
    // Find the requested event among the special events
    // currently registering and show its details
    // ========================================================
    private void GetEvent()
    {
        DataRow row = RegisteringPrograms.FindBySeason(
            RegisteringPrograms.CategoryKey("SpecialEventsCategoryKey"), Request.QueryString["season"]);

        if (row == null)
        {
            divEventInfo.Visible = false;
            lblContent.InnerHtml = "<p>This event is no longer available. See the Programs page for current special events.</p>";
            return;
        }

        string name = row["ProgramName"].ToString();

        litEventHeading.Text = Server.HtmlEncode(name);
        Page.Title = name + " | Burke County Recreation Department";
        divEventInfo.InnerHtml = RegisteringPrograms.GetInfoHtml(row);
        lblContent.InnerHtml = row["ProgramDescription"].ToString();
    }
}
