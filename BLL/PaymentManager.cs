using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystem.DAL;
using DiagnosticCenterBillManagementSystem.Model;

namespace DiagnosticCenterBillManagementSystem.BLL
{
    public class PaymentManager
    {
        PaymentGateWay paymentGateWay=new PaymentGateWay();
        public List<PaymentSearch> SearchGridViewData(PaymentSearch paymentsearch)
        {
           return paymentGateWay.SerchGridViewData(paymentsearch);
            
        }

        public List<PaymentSearch> SearchGridViewData2(PaymentSearch paymentsearch)
        {
            return paymentGateWay.SerchGridViewData2(paymentsearch);
        }

        public void SavePayment(PaymentSearch paymentSearch)
        {
            paymentGateWay.SavePayment(paymentSearch);
        }
    }
}