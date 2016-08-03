using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystem.Model;

namespace DiagnosticCenterBillManagementSystem.DAL
{
    public class TestTypeGateway
    {
        private string connectionstring = @"Server= SUKANTA_BALA\SQLEXPRESS; Database=DiagonosticCenterDB;Integrated Security = true";
        public int SaveTestType(TestType testType)
        {
            SqlConnection connection = new SqlConnection(connectionstring);

            string query = "INSERT INTO TestType VALUES('" + testType.TypeName + "')";
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            int rowaffected=command.ExecuteNonQuery();
            connection.Close();
            return rowaffected;
        }

        public TestType GetTestByTestType(string testType)
        {
            SqlConnection connection = new SqlConnection(connectionstring);

            string query = "SELECT * FROM TestType WHERE Type_Name='" + testType + "'";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            TestType test = null;

            while (reader.Read())
            {
                string typename = reader["Type_Name"].ToString();
                test = new TestType(typename);


            }
            connection.Close();
            return test;
        }

        public List<TestType> LoadAllTestTypes()
        {
            SqlConnection connection = new SqlConnection(connectionstring);
            string query = "SELECT * FROM TestType";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<TestType> testTypes = new List<TestType>();
            while (reader.Read())
            {
                string testtype = reader["Type_Name"].ToString();
                TestType testType = new TestType(testtype);
                testTypes.Add(testType);

            }
            reader.Close();
            connection.Close();
            return testTypes;

        }


    }
}