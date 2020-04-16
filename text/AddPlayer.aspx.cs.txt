using HockeyJeremiahMacDougall2.HockeyTableAdapters;
using System;
using System.Web.UI;


namespace HockeyJeremiahMacDougall2
{
    // create aliases outside the namespace
    using HockeyTable = Hockey.PlayerDataTable;

    public partial class AddPlayer : System.Web.UI.Page
    {
        // table adaptor 

        PlayerTableAdapter adpPlayers = new PlayerTableAdapter();


        //  table data

        HockeyTable tblPlayers = new HockeyTable();


        // common interview question - what are the 3 uses of the using statement:
        // create alias
        // used to call other name spaces
        // create a sql connection in a using block so it's closed automatically


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                // inserts data into database
                // get number of txt box
                tblPlayers = (HockeyTable)Cache["tblPlayers"];

                try
                {
                    // cache the table
                    int id = int.Parse(txtPlayerJersey.Text);
                    string name = txtPlayerName.Text.Trim();
                    int jersey = int.Parse(txtPlayerJersey.Text);

                    //  Console.WriteLine(playerExists[0].JerseyNumber);
                    var playerExists = adpPlayers.GetDataByJersey(jersey);

                    if (playerExists.Count == 0)  // insert logic here to check if jersey doesn't exist
                    {
                        // call the Insert() method on the adapter
                        int result = adpPlayers.Insert(name, jersey);

                        if (result == 1)
                        {
                            lblMessage.Text = "New Player Added";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            txtPlayerJersey.Text = "";
                            txtPlayerName.Text = "";
                            //   Page.Response.Redirect("Home.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Player Not Added";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else // jersey already exists
                    {
                        lblMessage.Text = "This Jersey already exists!";
                        lblMessage.ForeColor = System.Drawing.Color.Yellow;

                    }

                } // end try
                catch
                {
                    lblMessage.Text = "Please ensure valid text is entered.";
                    lblMessage.ForeColor = System.Drawing.Color.Yellow;
                }

            }
        }


    }
}