using System;
using System.Configuration;
using System.Web.UI;
using SCWebsiteContent2012;

public partial class YouthBasketball : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["OrganizationKey"] = ConfigurationManager.AppSettings["Organization"];

            GetContent();
            RegisteringPrograms.SetRegisterLink(lnkRegister, "YouthBasketballCategoryKey");
            lnkSchedules.HRef = "YouthSS.aspx?key=" + RegisteringPrograms.CategoryKey("YouthBasketballCategoryKey");
        }
    }

    // ========================================================
    // GetContent
    // Get the content
    // ========================================================
    private void GetContent()
    {
        WebTextDAL webTextDAL = new WebTextDAL();
        WebTextBE webTextBE = webTextDAL.GetWebtextByKey(Convert.ToInt32(ViewState["OrganizationKey"]), "Youth Basketball");

        lblContent.InnerHtml = webTextBE.WebtextVerbiage;
    }
}
