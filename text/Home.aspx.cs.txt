using HockeyJeremiahMacDougall2.HockeyTableAdapters;
using System;

namespace HockeyJeremiahMacDougall2
{
    public partial class Home : System.Web.UI.Page
    {
        // StatisticTableAdapter adpStats = new StatisticTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {

            // create the object of table adapter
            SummaryTableAdapter adpPlayers = new SummaryTableAdapter();
            // create the object of data table

            // Get Method

            grdHomeSummary.DataSource = adpPlayers.GetSummary();
            grdHomeSummary.DataBind();

            var winner = adpPlayers.GetDataByWinner();
            var loser = adpPlayers.GetDataByLoser();

            lblHighestPointsName.Text = "Player: " + winner[0].Name.ToString();
            lblHighestPoints.Text = "Highest Points: " + winner[0].Goals.ToString();

            lblLowestPointsName.Text = "Player: " + loser[0].Name.ToString();
            lblLowestPoints.Text = "Lowest Points: " + loser[0].Goals.ToString();
            Cache["tblStats"] = grdHomeSummary;

        }
    }
}