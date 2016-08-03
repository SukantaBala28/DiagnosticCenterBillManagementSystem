using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystem.DAL;
using DiagnosticCenterBillManagementSystem.Model;

namespace DiagnosticCenterBillManagementSystem.BLL
{
    public class TestRequestEntryManager
    {
        TestRequestEntryGateway testRequestEntryGateway=new TestRequestEntryGateway();

        public List<TestInputSetup> GetAll()
        {
            return testRequestEntryGateway.GetAll();
        }

        public string GetFeeById(int selectedId)
        {
            string fee= testRequestEntryGateway.GetFeeById(selectedId);
            return fee;
        }

        public void SaveAllTestRequestEntry(TestRequestEntry testRequestEntry)
        {
            testRequestEntryGateway.SaveTestRequestEntry(testRequestEntry);
        }

        public string GenerateAutoID(TestRequestEntry testRequestEntry)
        {
           string generateautoID= testRequestEntryGateway.GenerateAutoID(testRequestEntry);
            return generateautoID;
        }
    }
}