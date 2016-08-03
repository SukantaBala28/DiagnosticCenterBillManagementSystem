using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiagnosticCenterBillManagementSystem.Model
{
    public class PaymentSearch
    {
        public PaymentSearch() 
        {
            
        }
        public  PaymentSearch(string billNo)
        {
            this.BillNO = billNo;
        }

        public PaymentSearch(string paidAmount, string dueAmount,string billNo)
        {
            this.PaidAmount = paidAmount;
            this.DueAmount = dueAmount;
            this.BillNO = billNo;
        }
        public PaymentSearch(string testName, int feeAmount)
        {
            this.TestName = testName;
            this.FeeAmount = feeAmount;
        }

        public PaymentSearch(string billDate, int totalFee, string paidAmount, string dueAmount)
        {
            this.BillDate = billDate;
            this.TotalFee = totalFee;
            this.PaidAmount = paidAmount;
            this.DueAmount = dueAmount;
        }

        public string BillNO { get; set; }
        public string TestName { get; set; }
        public int FeeAmount { get; set; }
        public string BillDate { get; set; }
        public int TotalFee { get; set; }
        public string  PaidAmount { get; set; }
        public string DueAmount { get; set; }
    }
    
}