using System;
using System.Configuration;
using System.Web.UI;
using SCWebsiteContent2012;

public partial class YouthFlagFootball : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["OrganizationKey"] = ConfigurationManager.AppSettings["Organization"];

            GetContent();
            RegisteringPrograms.SetRegisterLink(lnkRegisterGirls, "YouthFlagFootballGirlsCategoryKey");
            RegisteringPrograms.SetRegisterLink(lnkRegisterCoed, "YouthFlagFootballCoedCategoryKey");
            lnkSchedulesGirls.HRef = "YouthSS.aspx?key=" + RegisteringPrograms.CategoryKey("YouthFlagFootballGirlsCategoryKey");
            lnkSchedulesCoed.HRef = "YouthSS.aspx?key=" + RegisteringPrograms.CategoryKey("YouthFlagFootballCoedCategoryKey");
        }
    }

    // ========================================================
    // GetContent
    // Get the content
    // ========================================================
    private void GetContent()
    {
        WebTextDAL webTextDAL = new WebTextDAL();
        WebTextBE webTextBE = webTextDAL.GetWebtextByKey(Convert.ToInt32(ViewState["OrganizationKey"]), "Youth Flag Football");

        // New page: its web text may not be set up in Jarvis yet.
        if (webTextBE != null)
        {
            lblContent.InnerHtml = webTextBE.WebtextVerbiage;
        }
    }
}
