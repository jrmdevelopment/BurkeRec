using System;
using System.Configuration;
using System.Web.UI;
using SCWebsiteContent2012;

public partial class YouthTBall : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["OrganizationKey"] = ConfigurationManager.AppSettings["Organization"];

            GetContent();
            RegisteringPrograms.SetRegisterLink(lnkRegister, "YouthTBallCategoryKey");
            lnkSchedules.HRef = "YouthSS.aspx?key=" + RegisteringPrograms.CategoryKey("YouthTBallCategoryKey");
        }
    }

    // ========================================================
    // GetContent
    // Get the content
    // ========================================================
    private void GetContent()
    {
        WebTextDAL webTextDAL = new WebTextDAL();
        WebTextBE webTextBE = webTextDAL.GetWebtextByKey(Convert.ToInt32(ViewState["OrganizationKey"]), "Youth TBall/BATS");

        // New page: its web text may not be set up in Jarvis yet.
        if (webTextBE != null)
        {
            lblContent.InnerHtml = webTextBE.WebtextVerbiage;
        }
    }
}
