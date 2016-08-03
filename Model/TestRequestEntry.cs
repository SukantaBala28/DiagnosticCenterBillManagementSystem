using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DiagnosticCenterBillManagementSystem.Model
{
    public class TestRequestEntry
    {
        public TestRequestEntry(string patientName, string mobileNo)
        {
            this.PatientName = patientName;
            this.MobileNo = mobileNo;
        }

        public TestRequestEntry(string patientName, string mobileNo, string patientDobTextBox, string totalAmount, string uniqueBill)
        {
            this.PatientName = patientName;
            this.MobileNo = mobileNo;
            this.PatientDOBTextBox = patientDobTextBox;
            this.TotalAmount = totalAmount;
            this.UniqueBill = uniqueBill;
        }

        public TestRequestEntry(string uniqueBill)
        {
            this.UniqueBill = uniqueBill;
        }

        public TestRequestEntry(int patientID)
        {
            this.PatientID = patientID;
        }

        public TestRequestEntry()
        {
            
        }

        public string UniqueBill { get; set; }

        public string TotalAmount { get; set; }

        public string PatientDOBTextBox { get; set; }
        public int PatientID { get; set; }

        public string PatientName { get; set; }
        public string MobileNo { get; set; }
        public int SelectTestID { get; set; }
        public string SelectFee { get; set; }
    }
}