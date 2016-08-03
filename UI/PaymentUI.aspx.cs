using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagnosticCenterBillManagementSystem.BLL;
using DiagnosticCenterBillManagementSystem.Model;

namespace DiagnosticCenterBillManagementSystem.UI
{
    public partial class PaymentUI : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        PaymentManager paymentManager=new PaymentManager();
        
        
       

        protected void searchButton_Click(object sender, EventArgs e)
        {
            PaymentSearch paymentSearch = new PaymentSearch(billNOTextBox.Text);
            
            List<PaymentSearch> paymentSearches= paymentManager.SearchGridViewData(paymentSearch);
            searchGridView.DataSource = paymentSearches;
            searchGridView.DataBind();

            List<PaymentSearch> paymentSearches1 = paymentManager.SearchGridViewData2(paymentSearch);
            foreach (var obj in paymentSearches1)
            {
                PaymentSearch payment = obj;
                billDateLabel.Text = payment.BillDate;
                totalFeeLabel.Text = payment.TotalFee.ToString();
                paidAmountLabel.Text = payment.PaidAmount.ToString();
                dueAmountLabel.Text = payment.DueAmount.ToString();
            }
           


        }

        protected void payButton_Click(object sender, EventArgs e)
        {
            int amount,totalAmount;
            amount = Convert.ToInt32(amountTextBox.Text);
            totalAmount = Convert.ToInt32(totalFeeLabel.Text);
            paidAmountLabel.Text = amount.ToString();
            dueAmountLabel.Text= (totalAmount - Convert.ToInt32(paidAmountLabel.Text)).ToString();


            PaymentSearch paymentSearch = new PaymentSearch(paidAmountLabel.Text,dueAmountLabel.Text,billNOTextBox.Text);
            paymentManager.SavePayment(paymentSearch);

        }
    }
}