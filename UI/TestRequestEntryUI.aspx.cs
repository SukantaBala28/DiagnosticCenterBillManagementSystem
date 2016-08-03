using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DiagnosticCenterBillManagementSystem.BLL;
using DiagnosticCenterBillManagementSystem.Model;
using iTextSharp.text;
using iTextSharp.text.pdf;
using ListItem = System.Web.UI.WebControls.ListItem;

namespace DiagnosticCenterBillManagementSystem.UI
{
   

    public partial class TestRequestEntryUI : System.Web.UI.Page
    {

        private string connectionstring = @"Server= SUKANTA_BALA\SQLEXPRESS; Database=DiagonosticCenterDB;Integrated Security = true";
        
        TestRequestEntryManager testRequestEntryManager=new TestRequestEntryManager();
        DataTable dt=new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<TestInputSetup> testName = testRequestEntryManager.GetAll();
                testSelectDropDownList.DataSource = testName;
                testSelectDropDownList.DataTextField = "TestName";
                testSelectDropDownList.DataValueField = "TestNameId";
                testSelectDropDownList.DataBind();
                testSelectDropDownList.Items.Insert(0, new ListItem("Select Test ",""));

                

                DataTable dataTable=new DataTable();
                dataTable.Columns.AddRange(new DataColumn[2]{ new DataColumn("TestName"),new DataColumn("Fee",dataType:typeof(int)) });
                ViewState["PatientID"] = dataTable;
                this.DataGrid();
                TestRequestEntry testRequestEntry1 = new TestRequestEntry(messageLabel.Text);

                string generateautoID=testRequestEntryManager.GenerateAutoID(testRequestEntry1);
                messageLabel.Text = generateautoID;

            }
            
        }

        

        private void DataGrid()
        {
            testRequestEntryGridview.DataSource = (DataTable) ViewState["PatientID"];
            testRequestEntryGridview.DataBind();
        }


        protected void addButton_Click(object sender, EventArgs e)
        {
            
            //for sum text box
            int sum = 0;
            DataTable dt = (DataTable) ViewState["PatientID"];
            dt.Rows.Add(testSelectDropDownList.SelectedItem.Text, Convert.ToInt32(feeTextBox.Text));
            ViewState["PatientID"] = dt;
            this.DataGrid();
            totalTextBox.Text = dt.Compute("sum(fee)","").ToString();
            //for (int i = 0; i <= testRequestEntryGridview.Rows.Count; i++)
            //{
            //    sum += Convert.ToInt32(testRequestEntryGridview.Rows[i].Cells[2].Value.ToString);
            //}
            //totalTextBox.Text = sum.ToString();

        }


        protected void calenderImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            patientDOBTextBox.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.Visible = false;
        }

        protected void testSelectDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
          // TestInputSetup testInputSetup=new TestInputSetup();
            List<TestInputSetup> testName = testRequestEntryManager.GetAll();
            int selected = Convert.ToInt32(testSelectDropDownList.SelectedItem.Value.ToString());

           string fee= testRequestEntryManager.GetFeeById(selected);
           feeTextBox.Text = fee;


        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            TestRequestEntry testRequestEntry = new TestRequestEntry(patientNameTextBox.Text,mobileNoTextBox.Text,patientDOBTextBox.Text,totalTextBox.Text,messageLabel.Text);
            testRequestEntryManager.SaveAllTestRequestEntry(testRequestEntry);
            

             foreach (GridViewRow g1 in testRequestEntryGridview.Rows)
            {
                SqlConnection connection = new SqlConnection(connectionstring);

                List<TestRequestEntry> testTypes = GetPatientID();
                //int patientID;
                //patientID = Convert.ToInt32(GetPatientID(testRequestEntry));
                testRequestEntry.PatientID = testTypes.Count+1;
                string query = "insert into TestRequestEntryGridView values ('" + g1.Cells[1].Text + "','" + g1.Cells[2].Text + "','" +testRequestEntry.PatientID + "')";
                 SqlCommand command=new SqlCommand(query,connection);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
 
            }
             
            //messageLabel.Text = "Records inserted successfully";
        }

        

        private List<TestRequestEntry> GetPatientID()
        {
             SqlConnection connection = new SqlConnection(connectionstring);

            string query = "SELECT * FROM Patients" ;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<TestRequestEntry> testRequestEntries=new List<TestRequestEntry>();

            while (reader.Read())
            {
                TestRequestEntry testRequestEntry=new TestRequestEntry();
                testRequestEntry.PatientID = Convert.ToInt32(reader["id"].ToString());
                testRequestEntries.Add(testRequestEntry);

            }
            connection.Close();
            return testRequestEntries;
        
        }

        protected void pdfButton_Click(object sender, EventArgs e)
        {
            Document document = new Document();
            string path = Server.MapPath("~/");
            PdfWriter.GetInstance(document, new FileStream(path + this.messageLabel.Text+"pdfDocument"+ ".pdf", FileMode.Create));
            document.Open();
            document.Add(new Phrase("Bill NO:" + this.messageLabel.Text + "\n"+"\n"));

            document.Add(new Phrase("\n"+"Name of the Patient:"+this.patientNameTextBox.Text+"\n"));
            document.Add(new Phrase("Date of Birth:"+ this.patientDOBTextBox.Text.Trim()+"\n"));
            document.Add(new Phrase("Mobile No:"+this.mobileNoTextBox.Text.Trim()+"\n"));
            document.Add(new Phrase(  this.dt + "\n"));
            document.Add(new Phrase("Total Amount:" + this.totalTextBox.Text.Trim() + "\n"));
           
            document.Close();
            
            
            
            //string path = Server.MapPath(("~/"));
            //string fileName = "pdfDocument" + DateTime.Now.Ticks + ".pdf";
            //GeneratePDF(path, fileName, false, "");

//            Document pdfDoc = new Document(PageSize.A4, 10, 10, 10, 10);

//try
//{
//    PdfWriter.GetInstance(pdfDoc, System.Web.HttpContext.Current.Response.OutputStream);
//    pdfDoc.Open();

//    //Set Font Properties for PDF File
//    Font fnt = FontFactory.GetFont("Times New Roman", 14);
  
//    PdfPTable PdfTable = new PdfPTable(1);
//    PdfPCell PdfPCell = null;

//    //Retrieve content from design side
//    string s = patientNameTextBox.Text;

//    PdfPCell = new PdfPCell(new Phrase(new Chunk(s, fnt)));
//    PdfTable.AddCell(PdfPCell);
//    pdfDoc.Add(PdfTable);
//    pdfDoc.Close();

//    Response.ContentType = "application/pdf";

//    //Set default file Name as current datetime
//    Response.AddHeader("content-disposition", "attachment; filename=" + DateTime.Now.ToString("yyyyMMdd") + ".pdf");

//    System.Web.HttpContext.Current.Response.Write(pdfDoc);

//    Response.Flush();
//    Response.End();

//}
//catch (Exception ex)
//{
//    Response.Write(ex.ToString());
//}
}



        }

        //private void GeneratePDF(string path, string fileName, bool download, string text)
        //{
        //    var document = new Document();
        //    try
        //    {
        //        if (download)
        //        {
        //            PdfWriter.GetInstance(document, Response.OutputStream);
        //        }
        //        else
        //        {
        //            PdfWriter.GetInstance(document, new FileStream(path + fileName, FileMode.Create));
        //        }
        //        StringBuilder stringBuilder=new StringBuilder();
        //        document.Open();
        //    }
        }
       
    

    
