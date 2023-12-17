using Microsoft.Data.SqlClient;

namespace Tranning
{
    public class DatabaseConnection
    {
        public static string getStrConnection()
        {
            string sTrConnection = @"Data Source=DESKTOP-6OVR3EK\TRANHOANGANH;Initial Catalog=Tranning;Integrated Security=True;TrustServerCertificate=True";
            return sTrConnection;
        }
        public static SqlConnection GetSqlConnection() 
        {
            string StrConnection = DatabaseConnection.getStrConnection();
            SqlConnection connection = new SqlConnection( StrConnection );
            return connection;
        }
    }
}
