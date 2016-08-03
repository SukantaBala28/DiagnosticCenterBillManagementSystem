using System.Collections.Generic;
using DiagnosticCenterBillManagementSystem.DAL;
using DiagnosticCenterBillManagementSystem.Model;

namespace DiagnosticCenterBillManagementSystem.BLL
{
    public class TestManager
    {
        TestGateway testGateway=new TestGateway();

        public int SaveTest(TestInputSetup test)
        {
            return testGateway.SaveTest(test);
        }

        public List<TestInputSetup> GetAllTests()
        {
            return testGateway.GetAllTests();
        }
        public List<TestType> GetAll()
        {
            return testGateway.GetAll();
        }

        public List<TestTypeTestInputSetupView> GetAllTestViews()
        {
            return testGateway.GetAllTestViews();
        }

        public bool IsTestNameExists(TestInputSetup test)
        {
            TestInputSetup existingTestName = testGateway.GetTestByTestName(test.TestName);

            if (existingTestName != null)
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