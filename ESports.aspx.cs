using System;
using System.Configuration;
using System.Web.UI;
using SCWebsiteContent2012;

public partial class ESports : Page
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
        WebTextBE webTextBE = webTextDAL.GetWebtextByKey(Convert.ToInt32(ViewState["OrganizationKey"]), "ESports");

        // New page: its web text may not be set up in Jarvis yet.
        if (webTextBE != null)
        {
            lblContent.InnerHtml = webTextBE.WebtextVerbiage;
        }
    }

    // ========================================================
    // GetClasses
    // Get the ESports classes currently registering; each one
    // is listed in full on this page
    // ========================================================
    private void GetClasses()
    {
        rptClasses.DataSource = RegisteringPrograms.GetRegistering(RegisteringPrograms.CategoryKey("ESportsCategoryKey"));
        rptClasses.DataBind();

        if (rptClasses.Items.Count == 0)
        {
            lblNoClasses.Visible = true;
            RegisteringPrograms.DisableRegisterLink(lnkRegister);
        }
    }
}
