using HockeyJeremiahMacDougall2.HockeyTableAdapters;
using System;
using System.Web.UI.WebControls;

namespace HockeyJeremiahMacDougall2
{
    // create aliases inside the namespace, outside class
    using HockeyTable = Hockey.PlayerDataTable;
    using StatTable = Hockey.StatisticDataTable;

    public partial class EditStats : System.Web.UI.Page

    {
        // table adaptor 

        PlayerTableAdapter adpPlayers = new PlayerTableAdapter();
        StatisticTableAdapter adpStats = new StatisticTableAdapter();

        //  table data

        HockeyTable tblPlayers = new HockeyTable();
        StatTable tblStats = new StatTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    tblPlayers = (HockeyTable)Cache["tblPlayers"];  // get from cache
                    tblStats = (StatTable)Cache["tblStats"];
                    tblStats[0].MatchesWon = int.Parse(txtMatchesWon.Text);
                    tblStats[0].Goals = int.Parse(txtGoals.Text);
                    tblStats[0].Assists = int.Parse(txtAssists.Text);
                    tblStats[0].MatchesPlayed = int.Parse(txtPlayed.Text);
                    adpStats.Update(tblStats);
                    lblMessage.Text = "Values Updated.";
                    lblMessage.ForeColor = System.Drawing.Color.Yellow;
                }
                catch
                {
                    lblMessage.ForeColor = System.Drawing.Color.Yellow;
                    lblMessage.Text = "An error occured.  Did you leave any fields blank?";
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //  in here, search for complete or partial matches from search text box, and add the results to the radio button(s)

            tblPlayers = (HockeyTable)Cache["tblPlayers"];

            string search = txtSearch.Text.Trim();
            var results = adpPlayers.GetSearchResults(search);
            txtMatchesWon.Text = txtGoals.Text = txtAssists.Text = txtPlayed.Text = "";
            if (results != null)
            {
                lblMessage.Text = "";
                rdoPlayerlist.Items.Clear();

                foreach (var element in results)
                {
                    rdoPlayerlist.Items.Add(new ListItem(element.PlayerName, element.PlayerId.ToString(), true));
                }
            }
            else
                lblMessage.Text = "No Results found.";

        }

        protected void rdoPlayerlist_SelectedIndexChanged(object sender, EventArgs e)
        {

            int search = int.Parse(rdoPlayerlist.SelectedValue);

            try
            {
                var results = adpStats.GetDataByPlayer(search);
                Cache["tblPlayers"] = tblPlayers;
                Cache["tblStats"] = results;

                txtMatchesWon.Text = results[0].MatchesWon.ToString();
                txtGoals.Text = results[0].Goals.ToString();
                txtAssists.Text = results[0].Assists.ToString();
                txtPlayed.Text = results[0].MatchesPlayed.ToString();
                lblMessage.Text = "";
                txtSearch.Text = rdoPlayerlist.SelectedItem.Text;
            }
            catch
            {
                lblMessage.Text = "No results found.  Try adding some statistics first.";
                lblMessage.ForeColor = System.Drawing.Color.Yellow;
                txtSearch.Text = txtMatchesWon.Text = txtGoals.Text = txtAssists.Text = txtPlayed.Text = "";
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    tblPlayers = (HockeyTable)Cache["tblPlayers"];  // get from cache
                    tblStats = (StatTable)Cache["tblStats"];
                    adpStats.Delete(tblStats[0].PlayerId);
                    lblMessage.Text = "Player statistics deleted.";
                    lblMessage.ForeColor = System.Drawing.Color.Yellow;
                    txtMatchesWon.Text = txtGoals.Text = txtAssists.Text = txtPlayed.Text = "";
                    rdoPlayerlist.Items.Clear();
                }
                catch
                {
                    lblMessage.Text = "Invalid data entered.";
                    lblMessage.ForeColor = System.Drawing.Color.Yellow;
                }
            }
        }
    }
}