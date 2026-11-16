using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SCWebsiteContent2012;

public partial class AdultSS : Page
{
    // Sports with game schedules, as { dropdown text, appSettings key holding the activity category key }
    private static readonly string[,] Sports =
    {
        { "Adult Basketball", "AdultBasketballCategoryKey" },
        { "Adult Softball", "AdultSoftballCategoryKey" }
    };
    protected void Page_Load(object sender, EventArgs e)
    {
        DisplayMessage.Text = "";

        if (!Page.IsPostBack)
        {
            ViewState["OrganizationKey"] = ConfigurationManager.AppSettings["Organization"];

            LoadSports();

            // AdultSS.aspx?key=xxx preselects the sport for that activity category key
            ListItem item = ddlSport.Items.FindByValue(Convert.ToString(Request.QueryString["key"]));

            if (item != null && item.Value != "")
            {
                ddlSport.ClearSelection();
                item.Selected = true;
                SelectSport();
            }
        }
    }

    // ========================================================
    // LoadSports
    // Fill the sport dropdown from the category keys in appSettings
    // ========================================================
    private void LoadSports()
    {
        ddlSport.Items.Add(new ListItem("-- Choose Sport --", ""));

        for (int i = 0; i < Sports.GetLength(0); i++)
        {
            ddlSport.Items.Add(new ListItem(Sports[i, 0], Convert.ToString(RegisteringPrograms.CategoryKey(Sports[i, 1]))));
        }
    }

    // ========================================================
    // ddlSport_SelectedIndexChanged
    // Selected a sport
    // ========================================================
    protected void ddlSport_SelectedIndexChanged(object sender, EventArgs e)
    {
        SelectSport();
    }

    // ========================================================
    // SelectSport
    // Find the active season for the selected sport and load
    // its leagues
    // ========================================================
    private void SelectSport()
    {
        ClearScreen();

        if (ddlSport.SelectedValue == "")
        {
            litSportsHeader.Text = "Schedules &amp; Standings";
            DisplayMessage.Text = "Please choose your sport from the dropdown.";
            return;
        }

        litSportsHeader.Text = HttpUtility.HtmlEncode(ddlSport.SelectedItem.Text) + " Schedules &amp; Standings";

        ViewState["ActivityCategoryKey"] = ddlSport.SelectedValue;
        GetProgramsForCategory();

        if (Convert.ToInt32(ViewState["SeasonKey"]) == 0)
        {
            DisplayMessage.Text = "There are no active programs for " + HttpUtility.HtmlEncode(ddlSport.SelectedItem.Text) + " at this time.";
        }
        else if (DisplayMessage.Text == "")
        {
            GetLeagues();
        }
    }

    // ========================================================
    // ClearScreen
    // Clear the screen
    // ========================================================
    private void ClearScreen()
    {
        ddlLeague.Items.Clear();
        ddlTeam.Items.Clear();

        litScheduleFor.Text = "";
        pnlSchedule.Visible = false;
        pnlStandings.Visible = false;

        ScheduleGrid.DataSource = null;
        ScheduleGrid.DataBind();

        TeamGrid.DataSource = null;
        TeamGrid.DataBind();
    }

    // ========================================================
    // GetProgramsForCategory
    // Get the programs for the specified category key
    // ========================================================
    private void GetProgramsForCategory()
    {
        RegistrationDAL registrationDAL = new RegistrationDAL();
        ViewState["SeasonKey"] = 0;

        // get the first one. should only be one active
        using (IDataReader objReader = registrationDAL.GetActiveSeasonBySportAndProgramType(Convert.ToInt32(ViewState["OrganizationKey"]), Convert.ToInt32(ViewState["ActivityCategoryKey"]), "Adult"))
        {
            while (objReader.Read())
            {
                ViewState["SeasonKey"] = Convert.ToInt32(objReader["SeasonKey"]);

                if (!Convert.ToBoolean(objReader["PostGameSchedule"]))
                {
                    DisplayMessage.Text = "Schedule is not yet ready to post.";
                }
            }
        }
    }

    // ========================================================
    // GetLeagues
    // Get the leagues that are participating in this season
    // ========================================================
    private void GetLeagues()
    {
        RegistrationDAL registrationDAL = new RegistrationDAL();

        DataTable dtLeague = registrationDAL.GetLeaguesBySeason(Convert.ToInt32(ViewState["SeasonKey"]), "A");

        ddlLeague.DataSource = dtLeague;
        ddlLeague.DataTextField = "LeagueName";
        ddlLeague.DataValueField = "LeagueKey";
        ddlLeague.DataBind();

        if (ddlLeague.Items.Count > 0)
        {
            ddlLeague.SelectedIndex = 0;
            GetTeamsAndSchedule();
        }
        else
        {
            DisplayMessage.Text = "There are no leagues setup. Contact your organization.";
        }
    }

    // ========================================================
    // ddlLeague_SelectedIndexChanged
    // Get the teams for the selected league
    // If showing standings, get the standing for the league
    // ========================================================
    protected void ddlLeague_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetTeamsAndSchedule();
    }

    // ========================================================
    // GetTeamsAndSchedule
    // Get the teams for and the schedule
    // ========================================================
    private void GetTeamsAndSchedule()
    {
        GetTeams();

        if (ddlTeam.Items.Count > 0)
        {
            GetSchedule();
        }
        else
        {
            pnlSchedule.Visible = false;
            DisplayMessage.Text = "There are no teams setup for the selected league.";
        }

        if (ShowStandings())
        {
            pnlStandings.Visible = true;
            GetTeamStandings();
        }
        else
        {
            pnlStandings.Visible = false;
        }
    }

    // ========================================================
    // GetTeams
    // Get the teams for the selected league
    // ========================================================
    private void GetTeams()
    {
        RegistrationDAL registrationDAL = new RegistrationDAL();

        DataTable dtTeam = registrationDAL.TeamsByLeague(Convert.ToInt32(ddlLeague.SelectedValue), "A");

        ddlTeam.Items.Clear();
        ddlTeam.DataSource = dtTeam;
        ddlTeam.DataTextField = "TeamName";
        ddlTeam.DataValueField = "TeamKey";
        ddlTeam.DataBind();

        if (ddlTeam.Items.Count > 0)
        {
            ddlTeam.SelectedIndex = 0;
        }
    }

    // ========================================================
    // ddlTeam_SelectedIndexChanged
    // Get the schedule
    // ========================================================
    protected void ddlTeam_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetSchedule();
    }

    // ========================================================
    // ShowStandings
    // Determine whether to show the standings
    // ========================================================
    private bool ShowStandings()
    {
        ScheduleDAL scheduleDAL = new ScheduleDAL();

        return scheduleDAL.ShowStandings(Convert.ToInt32(ddlLeague.SelectedValue));
    }

    // ========================================================
    // GetSchedule
    // Get the schedule for the league and team
    // ========================================================
    private void GetSchedule()
    {
        ScheduleDAL scheduleDAL = new ScheduleDAL();

        DataTable dtSchedule = scheduleDAL.GetTeamSchedule(Convert.ToInt32(ViewState["SeasonKey"]), Convert.ToInt32(ddlTeam.SelectedValue));
        PrepareColumns(ScheduleGrid, dtSchedule);

        // The score column only applies to leagues that keep standings
        if (!ShowStandings())
        {
            SetColumnVisible(ScheduleGrid, "WonLoss", false);
        }

        litScheduleFor.Text = "Schedule for " + HttpUtility.HtmlEncode(ddlTeam.SelectedItem.Text);
        pnlSchedule.Visible = true;

        ScheduleGrid.DataSource = dtSchedule;
        ScheduleGrid.DataBind();
    }

    // ========================================================
    // GetTeamStandings
    // Get the team standings when the league changes and
    //   standings are shown for the league
    // ========================================================
    private void GetTeamStandings()
    {
        OrganizationDAL organizationDAL = new OrganizationDAL();
        string standingsType = "";

        using (IDataReader objReader = organizationDAL.GetOrgPreferences(Convert.ToInt32(ViewState["OrganizationKey"])))
        {
            while (objReader.Read())
            {
                standingsType = Convert.ToString(objReader["StandingsType"]);
            }
        }

        ScheduleDAL scheduleDAL = new ScheduleDAL();
        DataTable dtStandings = null;

        if (standingsType == "Points")
        {
            dtStandings = scheduleDAL.ShowTeamStandings(Convert.ToInt32(ddlLeague.SelectedValue));
        }
        else if (standingsType == "Head")
        {
            dtStandings = scheduleDAL.GetTeamStandingsDT(Convert.ToInt32(ddlLeague.SelectedValue), standingsType);
        }

        if (dtStandings != null)
        {
            PrepareColumns(TeamGrid, dtStandings);
        }

        TeamGrid.DataSource = dtStandings;
        TeamGrid.DataBind();
    }

    // ========================================================
    // PrepareColumns
    // Show every bound column, then hide any whose field the
    // results don't include (e.g. HeadToHead on points
    // standings). Missing fields are added empty so binding
    // doesn't fail on them.
    // ========================================================
    private static void PrepareColumns(GridView grid, DataTable table)
    {
        foreach (DataControlField field in grid.Columns)
        {
            BoundField bound = field as BoundField;

            if (bound == null)
            {
                continue;
            }

            bound.Visible = true;

            if (!table.Columns.Contains(bound.DataField))
            {
                table.Columns.Add(bound.DataField);
                bound.Visible = false;
            }
        }
    }

    private static void SetColumnVisible(GridView grid, string dataField, bool visible)
    {
        foreach (DataControlField field in grid.Columns)
        {
            BoundField bound = field as BoundField;

            if (bound != null && bound.DataField == dataField)
            {
                bound.Visible = visible;
            }
        }
    }

    // ========================================================
    // Grid_PreRender
    // Render the header row in a <thead> so the site's
    // table.data styles apply
    // ========================================================
    protected void Grid_PreRender(object sender, EventArgs e)
    {
        GridView grid = (GridView)sender;

        if (grid.HeaderRow != null)
        {
            grid.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}
