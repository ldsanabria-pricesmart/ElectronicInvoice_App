using System.Configuration;

namespace ElectronicInvoice_App
{
    public class BDAccess
    {
        public string GetStringConnectionBD()
        {
            string connBD = ConfigurationManager.ConnectionStrings["connSQLServer"].ToString();
            return connBD;
        }
    }
}