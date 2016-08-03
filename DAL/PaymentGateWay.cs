using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystem.Model;

namespace DiagnosticCenterBillManagementSystem.DAL
{
    public class PaymentGateWay
    {
        private string connectionstring = @"Server= SUKANTA_BALA\SQLEXPRESS; Database=DiagonosticCenterDB;Integrated Security = true";
        public List<PaymentSearch> SerchGridViewData(PaymentSearch payment)
        {
            SqlConnection connection = new SqlConnection(connectionstring);

            string query = "SELECT * FROM VW_PatientsTestRequestEntryGridView where(BillNO like '%'+ @search +'%')";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.Add("@search", SqlDbType.VarChar).Value =payment.BillNO ;
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<PaymentSearch> paymentSearches = new List<PaymentSearch>();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            sqlDataAdapter.SelectCommand = command;
            while (reader.Read())
            {
                string TestName = reader["TestEntryGridView"].ToString();
                int FeeAmount = Convert.ToInt32(reader["FeeEntryGridView"].ToString());
                PaymentSearch paymentSearch = new PaymentSearch(TestName,FeeAmount);
                paymentSearches.Add(paymentSearch);

            }
            reader.Close();
            connection.Close();
            return paymentSearches;

        }

        public List<PaymentSearch> SerchGridViewData2(PaymentSearch payment)
        {
            SqlConnection connection = new SqlConnection(connectionstring);

            string query = "SELECT * FROM Patients where(BillNO like '%'+ @search +'%')";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.Add("@search", SqlDbType.VarChar).Value = payment.BillNO;
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<PaymentSearch> paymentSearches = new List<PaymentSearch>();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            sqlDataAdapter.SelectCommand = command;
            while (reader.Read())
            {
                string BillDate = reader["BillDate"].ToString();
                int TotalFee = Convert.ToInt32(reader["TotalAmount"].ToString());
                string PaidAmount = reader["PaidAmount"].ToString();
                string DueAmount = reader["DueAmount"].ToString();
                PaymentSearch paymentSearch = new PaymentSearch(BillDate,TotalFee,PaidAmount,DueAmount);
                paymentSearches.Add(paymentSearch);

            }
            reader.Close();
            connection.Close();
            return paymentSearches;

        }

        public void SavePayment(PaymentSearch paymentSearch)
        {
            SqlConnection connection = new SqlConnection(connectionstring);

            //string query = "INSERT INTO Patients(PaidAmount,DueAmount) VALUES('" + paymentSearch.PaidAmount+ "', '" + paymentSearch.DueAmount+ "') WHERE    (Patients.BillNO='"+paymentSearch.BillNO+"')";
            string query = "UPDATE Patients SET PaidAmount='" + paymentSearch.PaidAmount + "', DueAmount='" + paymentSearch.DueAmount + "' WHERE BillNO='"+paymentSearch.BillNO+"'";
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}