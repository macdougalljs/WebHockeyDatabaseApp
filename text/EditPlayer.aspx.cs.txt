using HockeyJeremiahMacDougall2.HockeyTableAdapters;
using System;
using System.Web.UI.WebControls;
namespace HockeyJeremiahMacDougall2
{
    // create aliases inside the namespace, outside class
    using HockeyTable = Hockey.PlayerDataTable;

    public partial class EditPlayer : System.Web.UI.Page
    {

        // table adaptor 

        PlayerTableAdapter adpPlayers = new PlayerTableAdapter();
        StatisticTableAdapter adpStats = new StatisticTableAdapter();
        //  table data

        HockeyTable tblPlayers = new HockeyTable();


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rdPlayerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int search = int.Parse(rdoPlayerList.SelectedValue);

            try
            {
                var results = adpPlayers.GetDataById(search);
                Cache["tblPlayers"] = results;

                txtPlayerName.Text = results[0].PlayerName;
                txtSearch.Text = results[0].PlayerName;
                txtJerseyNo.Text = results[0].JerseyNumber.ToString();
                lblMessage.Text = "";

            }
            catch
            {
                lblMessage.Text = "Now this is a strange error.";
                lblMessage.ForeColor = System.Drawing.Color.Yellow;

            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            tblPlayers = (HockeyTable)Cache["tblPlayers"];  // get from cache

            try
            {
                tblPlayers[0].JerseyNumber = int.Parse(txtJerseyNo.Text);
                tblPlayers[0].PlayerName = txtPlayerName.Text.Trim();

                adpPlayers.Update(tblPlayers);
                lblMessage.Text = "Values for " + txtPlayerName.Text + " Updated.";
                txtPlayerName.Text = txtJerseyNo.Text = "";
                txtSearch.Text = "";
                lblMessage.ForeColor = System.Drawing.Color.Yellow;

            }
            catch
            {
                lblMessage.Text = "Invalid inputs; ensure values are in numeric format only. ";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //  in here, search for complete or partial matches from search text box, and add the results to the radio button(s)

            tblPlayers = (HockeyTable)Cache["tblPlayers"];

            string search = txtSearch.Text.Trim();
            var results = adpPlayers.GetSearchResults(search);

            if (results != null)
            {
                lblMessage.Text = "";
                rdoPlayerList.Items.Clear();

                foreach (var element in results)
                {
                    rdoPlayerList.Items.Add(new ListItem(element.PlayerName, element.PlayerId.ToString(), true));
                }
            }
            else
                lblMessage.Text = "No Results found.";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            tblPlayers = (HockeyTable)Cache["tblPlayers"];  // get from cache

            if (Page.IsValid)
            {
                // delete table with foreign key first, if they exist
                if (tblPlayers != null)
                {
                    try
                    {

                        adpStats.Delete(tblPlayers[0].PlayerId);
                        adpPlayers.Delete(tblPlayers[0].PlayerId);
                        lblMessage.Text = "Player record and statistics deleted.";
                        lblMessage.ForeColor = System.Drawing.Color.Yellow;
                        txtJerseyNo.Text = txtPlayerName.Text = txtSearch.Text = "";
                        // delete player from main table
                        rdoPlayerList.Items.Clear();
                    }
                    catch
                    { }



                } // close tblplayers not null
                else
                    lblMessage.Text = "No player has been loaded.";

            }
        }
    }
}