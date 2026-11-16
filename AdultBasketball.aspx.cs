using System;
using System.Configuration;
using System.Web.UI;
using SCWebsiteContent2012;

public partial class AdultBasketball : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["OrganizationKey"] = ConfigurationManager.AppSettings["Organization"];

            GetContent();
            RegisteringPrograms.SetRegisterLink(lnkRegister, "AdultBasketballCategoryKey");
            lnkSchedules.HRef = "AdultSS.aspx?key=" + RegisteringPrograms.CategoryKey("AdultBasketballCategoryKey");
        }
    }

    // ========================================================
    // GetContent
    // Get the content
    // ========================================================
    private void GetContent()
    {
        WebTextDAL webTextDAL = new WebTextDAL();
        WebTextBE webTextBE = webTextDAL.GetWebtextByKey(Convert.ToInt32(ViewState["OrganizationKey"]), "Adult Basketball");

        lblContent.InnerHtml = webTextBE.WebtextVerbiage;
    }
}
