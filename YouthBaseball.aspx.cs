using System;
using System.Configuration;
using System.Web.UI;
using SCWebsiteContent2012;

public partial class YouthBaseball : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["OrganizationKey"] = ConfigurationManager.AppSettings["Organization"];

            GetContent();
            RegisteringPrograms.SetRegisterLink(lnkRegister, "YouthBaseballCategoryKey");
            lnkSchedules.HRef = "YouthSS.aspx?key=" + RegisteringPrograms.CategoryKey("YouthBaseballCategoryKey");
        }
    }

    // ========================================================
    // GetContent
    // Get the content
    // ========================================================
    private void GetContent()
    {
        WebTextDAL webTextDAL = new WebTextDAL();
        WebTextBE webTextBE = webTextDAL.GetWebtextByKey(Convert.ToInt32(ViewState["OrganizationKey"]), "Youth Baseball");

        lblContent.InnerHtml = webTextBE.WebtextVerbiage;
    }
}
