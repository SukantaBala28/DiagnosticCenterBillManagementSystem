namespace DiagnosticCenterBillManagementSystem.Model
{
    public class TestType
    {
        public TestType(string typeName)
        {
            this.TypeName = typeName;
        }

        public TestType()
        {
            
        }

        public string TypeName { get; set; }
        public int TypeNameID { get; set; }
    }
}