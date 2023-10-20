using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Data.SqlTypes;


namespace housePriceProject
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\omgen\\OneDrive\\Masaüstü\\Staj\\housePriceProject\\housePriceProject\\App_Data\\HouseViews.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string createTableSql =
                    @"IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='HousePredictions' AND xtype='U')
                        BEGIN
                            CREATE TABLE HousePredictions (
                                EvID INT PRIMARY KEY IDENTITY,
                                Bedrooms FLOAT,
                                Bathrooms FLOAT,
                                Sqft_living FLOAT,
                                Sqft_lot FLOAT,
                                Floors FLOAT,
                                Waterfront FLOAT,
                                Condition FLOAT,
                                Sqft_above FLOAT,
                                Sqft_basement FLOAT,
                                Yr_built FLOAT,
                                Yr_renovated FLOAT,
                                Country NVARCHAR(MAX),
                                City NVARCHAR(MAX),
                                Statezip NVARCHAR(MAX),
                                Street NVARCHAR(MAX),
                                [View] INT
                            );
                        END;";

                using (SqlCommand command = new SqlCommand(createTableSql, connection))
                {
                    command.ExecuteNonQuery();
                }

                connection.Close();
            }
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