using System;
using System.Web.UI;

public partial class Programs : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetCamps();
            GetSpecialEvents();
        }
    }

    // ========================================================
    // GetCamps
    // Get the camps currently registering
    // ========================================================
    private void GetCamps()
    {
        rptCamps.DataSource = RegisteringPrograms.GetRegistering(RegisteringPrograms.CategoryKey("CampsCategoryKey"));
        rptCamps.DataBind();

        if (rptCamps.Items.Count == 0)
        {
            lblNoCamps.Visible = true;
        }
    }

    // ========================================================
    // GetSpecialEvents
    // Get the special events currently registering
    // ========================================================
    private void GetSpecialEvents()
    {
        rptSpecialEvents.DataSource = RegisteringPrograms.GetRegistering(RegisteringPrograms.CategoryKey("SpecialEventsCategoryKey"));
        rptSpecialEvents.DataBind();

        if (rptSpecialEvents.Items.Count == 0)
        {
            lblNoSpecialEvents.Visible = true;
        }
    }
}
