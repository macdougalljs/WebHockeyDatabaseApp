using System;
using System.Web.UI;

namespace HockeyJeremiahMacDougall2
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptResourceDefinition jqueryDef = new ScriptResourceDefinition();
            jqueryDef.Path = "https://code.jquery.com/jquery-3.4.1.min.js";
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", jqueryDef);
            // loads all the built in controls for jquery  - not on test
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}