using System;

namespace DiagnosticCenterBillManagementSystem.Model

{
    [Serializable]
    public class TestInputSetup
    {

        public TestInputSetup(string testName, string fee)
        {
            this.TestName = testName;
            this.Fee = fee;
        }

        public TestInputSetup()
        {
            
        }

       
        public int TestNameId { get; set; }
        public string TestName { get; set; }

        public string Fee { get; set; }
        public int TestTypeId { get; set; }
        
    }
}