using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystem.Model;

namespace DiagnosticCenterBillManagementSystem.DAL
{
    public class TestRequestEntryGateway
    {
        private string connectionstring = @"Server= SUKANTA_BALA\SQLEXPRESS; Database=DiagonosticCenterDB;Integrated Security = true";
        private string billId = "BillNO";
        public List<TestInputSetup> GetAll()
        {
            SqlConnection connection = new SqlConnection(connectionstring);
            string query = "SELECT * FROM Test";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<TestInputSetup> testNames = new List<TestInputSetup>();
            while (reader.Read())
            {
                TestInputSetup testName = new TestInputSetup();
                testName.TestName = reader["Test_Name"].ToString();
                testName.TestNameId = Convert.ToInt32(reader["Id"].ToString());
                testNames.Add(testName);
            }
            connection.Close();
            return testNames;
        }


        public string GetFeeById(int selectedId)
        {
            SqlConnection connection = new SqlConnection(connectionstring);

            string query = "SELECT * FROM Test WHERE Id ='" + selectedId + "'";

            SqlCommand command = new SqlCommand(query, connection);


            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            TestInputSetup testInputSetup=new TestInputSetup();

            while (reader.Read())
            {
                testInputSetup.Fee= reader["Fee"].ToString();

            }
            string fee = testInputSetup.Fee;

            reader.Close();
            connection.Close();
            return fee;
        }

        public void SaveTestRequestEntry(TestRequestEntry testRequestEntry)
        {
            SqlConnection connection = new SqlConnection(connectionstring);
            connection.Open();
            string query = "INSERT INTO Patients(Name,Date_Of_Birth,Mobile,BillNO,TotalAmount) VALUES('" + testRequestEntry.PatientName + "','" + testRequestEntry.PatientDOBTextBox + "','" + testRequestEntry.MobileNo + "','" + testRequestEntry.UniqueBill + "','" + testRequestEntry.TotalAmount + "')";
            SqlCommand command=new SqlCommand(query,connection);
            command.ExecuteNonQuery();
            connection.Close();
            GenerateAutoID(testRequestEntry);
            //SaveGridViewData(testRequestEntry);
        }

        private bool SaveGridViewData(TestRequestEntry testRequestEntry)
        {
            SqlConnection connection = new SqlConnection(connectionstring);
            connection.Open();
            string query = "INSERT INTO Patients(Name,Date_Of_Birth,Mobile,BillNO,TotalAmount) VALUES('" + testRequestEntry.PatientName + "','" + testRequestEntry.PatientDOBTextBox + "','" + testRequestEntry.MobileNo + "','" + testRequestEntry.UniqueBill + "','" + testRequestEntry.TotalAmount + "')";
            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();
            connection.Close();
            return true;
        }


        public string GenerateAutoID(TestRequestEntry testRequestEntry)
        {
            SqlConnection connection = new SqlConnection(connectionstring);
            connection.Open();
            string query = "Select Count(BillNO) from Patients";

            SqlCommand command = new SqlCommand(query, connection);
            int i = Convert.ToInt32((command.ExecuteScalar()));
            connection.Close();
            i++;
            testRequestEntry.UniqueBill = billId + i.ToString();
            return testRequestEntry.UniqueBill;
        }
    }
}