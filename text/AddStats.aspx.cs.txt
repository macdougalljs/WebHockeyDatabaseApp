using HockeyJeremiahMacDougall2.HockeyTableAdapters;
using System;
using System.Web.UI.WebControls;

namespace HockeyJeremiahMacDougall2
{
    // create aliases outside the namespace
    using HockeyTable = Hockey.PlayerDataTable;
    public partial class AddStats : System.Web.UI.Page
    {
        // table adaptor 

        PlayerTableAdapter adpPlayers = new PlayerTableAdapter();
        StatisticTableAdapter adpStats = new StatisticTableAdapter();
        //  table data

        HockeyTable tblPlayers = new HockeyTable();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tblPlayers = adpPlayers.GetPlayers();

                // populate the Players drop box
                foreach (var element in tblPlayers)
                {
                    //  ddlPlayerNames.Items.Insert(0, new ListItem(element.JerseyNumber + " " + element.PlayerName, element.PlayerId.ToString(), true));
                    ddlPlayerNames.Items.Add(new ListItem(element.JerseyNumber + " " + element.PlayerName, element.PlayerId.ToString(), true));
                }

                /*
                 Note to self, never databind a table to a radio button, what a horrible mistake 

               */

                ddlPlayerNames.Items.Insert(0, new ListItem("Select a player", "-1", true));
                ddlPlayerNames.Enabled = true;

            }
        }

        protected void ddlPlayerNames_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPlayerNames.SelectedItem != null)
            {
                // read the selected players jersey number, use as primary key for stats
                int jerseyNo = int.Parse(ddlPlayerNames.SelectedValue);

                // cache the table

                tblPlayers = (HockeyTable)Cache["tbl"];

            }
        }

        protected void PlayedValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                if ((int.Parse(txtMatchesWon.Text) <= int.Parse(txtPlayed.Text)) && int.Parse(txtPlayed.Text) >= 0)
                {
                    args.IsValid = true;
                }
                else
                    args.IsValid = false;
            }
            catch
            {
                args.IsValid = false;
                lblMessage.ForeColor = System.Drawing.Color.Yellow;
                lblMessage.Text = "An error occured.  Did you leave any fields blank?";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // read the selected players jersey number, use as primary key for stats
                int jerseyNo = int.Parse(ddlPlayerNames.SelectedValue);

                // cache the table
                try
                {
                    tblPlayers = (HockeyTable)Cache["tbl"];
                    int assists = int.Parse(txtAssists.Text);
                    int goals = int.Parse(txtGoals.Text);
                    int won = int.Parse(txtMatchesWon.Text);
                    int played = int.Parse(txtPlayed.Text);

                    // check if the record already exists??


                    // call the Insert() method on the adapter

                    int result = adpStats.Insert(jerseyNo, jerseyNo, played, won, assists, goals, null);
                    // int result = adpPlayers.Insert(name, jersey);
                    lblMessage.Text = "New Stats Added";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    ddlPlayerNames.SelectedIndex = 0;
                    txtAssists.Text = txtGoals.Text = txtMatchesWon.Text = txtPlayed.Text = "";
                }
                catch
                {
                    lblMessage.Text = "Addition failed - does this player already have stats?";
                    lblMessage.ForeColor = System.Drawing.Color.Yellow;
                    txtAssists.Text = txtGoals.Text = txtMatchesWon.Text = txtPlayed.Text = "";
                }
            }
        }
    }
}