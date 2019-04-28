using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB9_Institute_Management_System
{
    public partial class Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + Session["result"].ToString() + "')", true);
        }
    }
}