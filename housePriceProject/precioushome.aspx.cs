using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HousePriceProjectML.Model;
using System.Data.SqlClient;

namespace housePriceProject
{
    public partial class precioushome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PredictionResult()
        {
            //Tahmin için gerekli girdiler
            ModelInput input = new ModelInput
            {
                Date = Hdate.Text,
                Bedrooms = float.Parse(Hbed.Text),
                Bathrooms = float.Parse(Hbath.Text),
                Sqft_living = float.Parse(Hnet.Text),
                Sqft_lot = float.Parse(Hbrut.Text),
                Floors = float.Parse(Hfloor.Text),
                Waterfront = float.Parse(Hwater.Text),
                Condition = float.Parse(Hcon.Text),
                Sqft_above = float.Parse(Habove.Text),
                Sqft_basement = float.Parse(Hbasement.Text),
                Yr_built = float.Parse(Hbuilt.Text),
                Yr_renovated = float.Parse(Hreno.Text),
                Country = Hcountry.SelectedValue,
                City = Hcity.SelectedValue,
                Statezip = Hzip.Text,
                Street = Hadress.Text,
            };

            //Tahmin işlemi
            ModelOutput output = ConsumeModel.Predict(input);

            //Tahmin sonucunu yazdır
            Hpguess.Text = output.Score.ToString();

            CheckAndUpdateExistingPrediction(input);
        }

        protected void buttonGuess(object sender, EventArgs e)
        {
            PredictionResult();
        }


        protected void CheckAndUpdateExistingPrediction(ModelInput input)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\omgen\\OneDrive\\Masaüstü\\Staj\\housePriceProject\\housePriceProject\\App_Data\\HouseViews.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string checkSql = "SELECT EvID, [View] FROM HousePredictions WHERE Bedrooms = @Bedrooms AND Bathrooms = @Bathrooms AND Sqft_living = @Sqft_living AND Sqft_lot = @Sqft_lot AND Floors = @Floors AND Waterfront = @Waterfront AND Condition = @Condition AND Sqft_above = @Sqft_above AND Sqft_basement = @Sqft_basement AND Yr_built = @Yr_built AND Yr_renovated = @Yr_renovated AND Country = @Country AND City = @City AND Statezip = @Statezip AND Street = @Street";

                using (SqlCommand command = new SqlCommand(checkSql, connection))
                {
                    command.Parameters.AddWithValue("@Bedrooms", input.Bedrooms);
                    command.Parameters.AddWithValue("@Bathrooms", input.Bathrooms);
                    command.Parameters.AddWithValue("@Sqft_living", input.Sqft_living);
                    command.Parameters.AddWithValue("@Sqft_lot", input.Sqft_lot);
                    command.Parameters.AddWithValue("@Floors", input.Floors);
                    command.Parameters.AddWithValue("@Waterfront", input.Waterfront);
                    command.Parameters.AddWithValue("@Condition", input.Condition);
                    command.Parameters.AddWithValue("@Sqft_above", input.Sqft_above);
                    command.Parameters.AddWithValue("@Sqft_basement", input.Sqft_basement);
                    command.Parameters.AddWithValue("@Yr_built", input.Yr_built);
                    command.Parameters.AddWithValue("@Yr_renovated", input.Yr_renovated);
                    command.Parameters.AddWithValue("@Country", input.Country);
                    command.Parameters.AddWithValue("@City", input.City);
                    command.Parameters.AddWithValue("@Statezip", input.Statezip);
                    command.Parameters.AddWithValue("@Street", input.Street);

                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        int EvID = reader.GetInt32(0);
                        int viewCount = reader.GetInt32(1);

                        viewCount++;

                        string updateSql = "UPDATE HousePredictions SET [View] = @View WHERE EvID = @EvID";

                        reader.Close();

                        using (SqlCommand updateCommand = new SqlCommand(updateSql, connection))
                        {
                            updateCommand.Parameters.AddWithValue("View", viewCount);
                            updateCommand.Parameters.AddWithValue("@EvID", EvID);

                            updateCommand.ExecuteNonQuery();
                        }

                        Hview.Text = viewCount.ToString();
                    }
                    else
                    {
                        // Aynı bilgilere sahip ev bulunamadı, yeni kayıt ekle
                        reader.Close();

                        string insertSql = @"
                            INSERT INTO HousePredictions (Bedrooms, Bathrooms, Sqft_living, Sqft_lot, Floors, Waterfront, Condition, Sqft_above, Sqft_basement, Yr_built, Yr_renovated, Country, City, Statezip, Street, [View])
                            VALUES (@Bedrooms, @Bathrooms, @Sqft_living, @Sqft_lot, @Floors, @Waterfront, @Condition, @Sqft_above, @Sqft_basement, @Yr_built, @Yr_renovated, @Country, @City, @Statezip, @Street, 1)";

                        using (SqlCommand insertCommand = new SqlCommand(insertSql, connection))
                        {
                            insertCommand.Parameters.AddWithValue("@Bedrooms", input.Bedrooms);
                            insertCommand.Parameters.AddWithValue("@Bathrooms", input.Bathrooms);
                            insertCommand.Parameters.AddWithValue("@Sqft_living", input.Sqft_living);
                            insertCommand.Parameters.AddWithValue("@Sqft_lot", input.Sqft_lot);
                            insertCommand.Parameters.AddWithValue("@Floors", input.Floors);
                            insertCommand.Parameters.AddWithValue("@Waterfront", input.Waterfront);
                            insertCommand.Parameters.AddWithValue("@Condition", input.Condition);
                            insertCommand.Parameters.AddWithValue("@Sqft_above", input.Sqft_above);
                            insertCommand.Parameters.AddWithValue("@Sqft_basement", input.Sqft_basement);
                            insertCommand.Parameters.AddWithValue("@Yr_built", input.Yr_built);
                            insertCommand.Parameters.AddWithValue("@Yr_renovated", input.Yr_renovated);
                            insertCommand.Parameters.AddWithValue("@Country", input.Country);
                            insertCommand.Parameters.AddWithValue("@City", input.City);
                            insertCommand.Parameters.AddWithValue("@Statezip", input.Statezip);
                            insertCommand.Parameters.AddWithValue("@Street", input.Street);

                            insertCommand.ExecuteNonQuery();

                            Hview.Text = "1";

                        }
                    }
                }
            }
        }

    }
}