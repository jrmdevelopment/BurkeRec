using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class Staff : Page
{
    /// <summary>Simple view model for a staff member.</summary>
    public class StaffMember
    {
        public string Name { get; set; }
        public string Position { get; set; }
        public string Contact { get; set; }

        public StaffMember(string name, string position, string contact)
        {
            Name = name;
            Position = position;
            Contact = contact;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            rptStaff.DataSource = GetStaff();
            rptStaff.DataBind();
        }
    }

    private List<StaffMember> GetStaff()
    {
        return new List<StaffMember>
        {
            new StaffMember("Stephen Waskey", "Director", "s.waskey@burkecounty-ga.gov"),
            new StaffMember("Robert Allen", "Assistant Director", "r.allen@burkecounty-ga.gov"),
            new StaffMember("Ashley Neely", "Program Manager (Special Events, Concessions & other programs)", "a.neely@burkecounty-ga.gov"),
            new StaffMember("Corey D. Dent", "Athletic Manager (Soccer, Volleyball, Basketball & more)", "c.dent@burkecounty-ga.gov"),
            //new StaffMember("Joseph Hernandez", "Athletic Coordinator (Baseball & Softball)", "j.hernandez@burkecounty-ga.gov"),
            new StaffMember("Chris Castle", "Athletic Coordinator (Football & Track)", "c.castle@burkecounty-ga.gov"),
            new StaffMember("Emma Wise", "Program Coordinator (Classes & Special Events)", "e.wise@burkecounty-ga.gov"),
            new StaffMember("Tammy Banks", "Office Clerk", "t.banks@burkecounty-ga.gov"),
            new StaffMember("Buffy Bell", "Recreation Custodian", "bu.bell@burkecounty-ga.gov"),
            new StaffMember("Lori Chance", "Fitness Instructor", "706-339-5567"),
            new StaffMember("Kathleen Dolan", "Ceramics Instructor", "706-554-5210"),
            new StaffMember("Divante Jones", "Part-Time Boxing Supervisor", "706-554-5210")
        };
    }

    /// <summary>
    /// Renders a contact value as a mailto or tel link depending on its format.
    /// </summary>
    protected string FormatContact(string contact)
    {
        if (string.IsNullOrEmpty(contact))
        {
            return string.Empty;
        }

        if (contact.Contains("@"))
        {
            string safe = Server.HtmlEncode(contact);
            return string.Format("<a href=\"mailto:{0}\">{0}</a>", safe);
        }

        string digits = contact.Replace("-", string.Empty).Replace(" ", string.Empty);
        return string.Format("<a href=\"tel:{0}\">{1}</a>", digits, Server.HtmlEncode(contact));
    }
}
