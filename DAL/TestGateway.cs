using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using DiagnosticCenterBillManagementSystem.Model;

namespace DiagnosticCenterBillManagementSystem.DAL
{
    public class TestGateway
    {
        private string connectionstring = @"Server= SUKANTA_BALA\SQLEXPRESS; Database=DiagonosticCenterDB;Integrated Security = true";


        public int SaveTest(TestInputSetup test)
        {
            SqlConnection connection = new SqlConnection(connectionstring);

            string query = "INSERT INTO Test VALUES('" + test.TestName + "', '" + test.Fee + "','" + test.TestTypeId + "')";
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            int rowaffected=command.ExecuteNonQuery();

            connection.Close();
            return rowaffected;
        }

        public TestInputSetup GetTestByTestName(string testName)
        {
            SqlConnection connection = new SqlConnection(connectionstring);

            string query = "SELECT * FROM Test WHERE Test_Name='" + testName + "'";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            TestInputSetup test = null;

            while (reader.Read())
            {
                string testname = reader["Test_Name"].ToString();
                string Fee = reader["Fee"].ToString();
                test = new TestInputSetup(testname,Fee);


            }
            connection.Close();
            return test;
        }

        public List<TestType> GetAll()
        {
            SqlConnection connection = new SqlConnection(connectionstring);
            string query = "SELECT * FROM TestType";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<TestType> testTypes = new List<TestType>();
            while (reader.Read())
            {
                TestType testtype = new TestType();
                testtype.TypeName = reader["Type_Name"].ToString();
                testtype.TypeNameID = Convert.ToInt32(reader["Id"].ToString());
                testTypes.Add(testtype);
            }
            connection.Close();
            return testTypes;
        }

        public List<TestInputSetup> GetAllTests()
        {
            SqlConnection connection = new SqlConnection(connectionstring);
            string query = "SELECT * FROM Test";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<TestInputSetup> testTypes = new List<TestInputSetup>();
            while (reader.Read())
            {
                string testname = reader["Test_Name"].ToString();
                string fee = reader["Fee"].ToString();
                TestInputSetup testInformation = new TestInputSetup(testname, fee);
                testTypes.Add(testInformation);

            }
            reader.Close();
            connection.Close();
            return testTypes;
        }

        public List<TestTypeTestInputSetupView> GetAllTestViews()
        {
            SqlConnection connection = new SqlConnection(connectionstring);


            // write query 

            string query = "SELECT * FROM VW_Test";

            // execute query, read data

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            List<TestTypeTestInputSetupView> testViews = new List<TestTypeTestInputSetupView>();

            while (reader.Read())
            {
                string TestName = reader["Test_Name"].ToString();
                string Fee = reader["Fee"].ToString();
                string TestType = reader["Type_Name"].ToString();
                TestTypeTestInputSetupView testView = new TestTypeTestInputSetupView();
                testView.TestName = TestName;
                testView.Fee = Fee;
                testView.TestType = TestType;
                testViews.Add(testView);
            }
            reader.Close();
            connection.Close();
            return testViews;
        }
        } 
    }
