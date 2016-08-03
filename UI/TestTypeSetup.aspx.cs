using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using DiagnosticCenterBillManagementSystem.BLL;
using DiagnosticCenterBillManagementSystem.Model;

namespace DiagnosticCenterBillManagementSystem.UI
{
    public partial class TestTypeSetup : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        TestTypeManager testTypeManager = new TestTypeManager();
        protected void saveButton_Click(object sender, EventArgs e)
        {
            TestType testType=new TestType(testTypeTextBox.Text);
            if (testTypeTextBox.Text != string.Empty)
            {
                if (testTypeManager.IsTestTypeExists(testType))
                {
                    messageLabel.Text = "Test Type already exists!";
                    return;
                }


                int rowAffected = testTypeManager.SaveTestType(testType);
                if (rowAffected > 0)
                {
                    messageLabel.Text = "Saved Successfully!";
                    LoadAllTestTypes();
                }
                else
                {
                    messageLabel.Text = "Insertion Failed!";
                }

            }
            else
            {
                messageLabel.Text = "Please Insert The Test Type";
            }



        }

        private void LoadAllTestTypes()
        {
            List<TestType> testTypes = testTypeManager.GetAllTestTypes();
            testTypeGridview.DataSource = testTypes;
            testTypeGridview.DataBind();
        }
    }
}