using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using DiagnosticCenterBillManagementSystem.BLL;
using DiagnosticCenterBillManagementSystem.Model;

namespace DiagnosticCenterBillManagementSystem.UI
{
    public partial class TestSetup : System.Web.UI.Page
    {
        TestManager testManager=new TestManager();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                //Test Type Dropdown list
                List<TestType> testTypes = testManager.GetAll();
                testTypeDropDownlist.DataSource = testTypes;
                testTypeDropDownlist.DataTextField = "TypeName";
                testTypeDropDownlist.DataValueField = "TypeNameID";
                testTypeDropDownlist.DataBind();
            }
            
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            TestInputSetup test = new TestInputSetup(testnameTextBox.Text,feeTextBox.Text);

            if (testnameTextBox.Text != string.Empty && feeTextBox.Text != string.Empty)
            {
                int selectedTestTypeId = Convert.ToInt32(testTypeDropDownlist.SelectedValue.ToString());
                test.TestTypeId = selectedTestTypeId;

                if (testManager.IsTestNameExists(test))
                {
                    messageLabel.Text = "Test Name already exists!";
                    return;
                }


                int rowAffected = testManager.SaveTest(test);
                if (rowAffected > 0)
                {
                    messageLabel.Text = "Saved Successfully!";
                    LoadAllTests();
                }
                else
                {
                    messageLabel.Text = "Insertion Failed!";
                }
            
            }
            else
            {
                messageLabel.Text = "Test Name and Fee cannot be empty";
            }

            
        }
        private void LoadAllTests()
        {
            
            //List<TestInputSetup>test = testManager.GetAllTests();
            List<TestTypeTestInputSetupView> testViews = testManager.GetAllTestViews();
            testInputTypeGridview.DataSource = testViews;
            testInputTypeGridview.DataBind();
        }
    }
}