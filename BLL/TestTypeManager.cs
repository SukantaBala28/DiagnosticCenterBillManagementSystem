using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystem.DAL;
using DiagnosticCenterBillManagementSystem.Model;

namespace DiagnosticCenterBillManagementSystem.BLL
{
   
    public class TestTypeManager
    {
        TestTypeGateway testTypeGateway= new TestTypeGateway();

        public int SaveTestType(TestType testType)
        {
            return testTypeGateway.SaveTestType(testType);
        }

        public List<TestType> GetAllTestTypes()
        {
            return testTypeGateway.LoadAllTestTypes();
        }
        public bool IsTestTypeExists(TestType testtype)
        {
            TestType existingTestType = testTypeGateway.GetTestByTestType(testtype.TypeName);

            if (existingTestType != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }



        
    }
}