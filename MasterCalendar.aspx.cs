using System;
using System.Web.UI;

/// <summary>
/// Master calendar. The Kendo UI scheduler on the page loads its events
/// client-side from TelerikScheduler.ashx, so there is no server work here.
/// </summary>
public partial class MasterCalendar : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
}
