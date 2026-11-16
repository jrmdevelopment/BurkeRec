using System;
using System.Configuration;
using System.Web.UI;
using SCWebsiteContent2012;

public partial class Pickleball : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["OrganizationKey"] = ConfigurationManager.AppSettings["Organization"];

            GetContent();
            GetClasses();
        }
    }

    // ========================================================
    // GetContent
    // Get the content
    // ========================================================
    private void GetContent()
    {
        WebTextDAL webTextDAL = new WebTextDAL();
        WebTextBE webTextBE = webTextDAL.GetWebtextByKey(Convert.ToInt32(ViewState["OrganizationKey"]), "Pickleball");

        lblContent.InnerHtml = webTextBE.WebtextVerbiage;
    }

    // ========================================================
    // GetClasses
    // Get the pickleball classes currently registering; each one
    // is listed in full on this page
    // ========================================================
    private void GetClasses()
    {
        rptClasses.DataSource = RegisteringPrograms.GetRegistering(RegisteringPrograms.CategoryKey("PickleballCategoryKey"));
        rptClasses.DataBind();

        if (rptClasses.Items.Count == 0)
        {
            lblNoClasses.Visible = true;
            RegisteringPrograms.DisableRegisterLink(lnkRegister);
        }
    }
}
