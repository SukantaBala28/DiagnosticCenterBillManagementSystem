# DiagnosticCenterBillManagementSystem
This is a small application for Diagnostic Center. By this asp.net web application a user easily manage Bill System.
DiagnosticCenterBillManagementSystem is a ASP.NET WEB Appcation.

This web application will manage billing activities for a small diagnostic center. Generally, small diagnostic offers several
types of tests like Complete blood count, Lipid profile, Urine C/S-200, X-Ray LS Spine, USG Lower abdomen etc. 
Since bill processing for these types of tests requires paper work and is very error prone, I am  offering this application 
to process it automatically from their side. 

It has seven story/Page. Each page has Unique functionality.

#Page NO #1
#Type Setup
User will enter some basic tests’ type (like Blood, Urine, ECG, X-Ray) using this UI. Type name will be unique. 
Type list will be ordered by Type Name.

#Page NO #2
#Test Setup 
User will enter some basic tests information (like whole abdomen, pregnancy profile, Urine C/S-200, X-Ray LS Spine) using this UI. Test name will be unique.
Test list be ordered by Test name.


#Page NO #3
#Test Request Entry
When a parient comes for some tests, user of the diagnostics will enter all tests information for this patient.  
When ‘Add’ button will be clicked, entered information will be displayed in grid. 
Finally, when user will click ‘Save’, all information will be saved in database and a PDF will be opened which contain unique bill number and print date.


#Page NO #4
#Payment

User of this UI will use it when patient comes to pay for the bill. User will enter Bill No or mobile number and click Search 
button, Total amount and due date against this bill no will be diplayed. After that user will take amount from patient and 
click Pay button to update bill payment status



#Page NO #5
Test Wise Report

User will select from and to date and click show button, test name, total number of tests and total amount will be displayed.
If any test has no test request for selected dates between, these will also be displayed with their number of test and total 
amount will be zero.



#Page NO #6
#Type Wise Report

User will select from and to date and click Show button, type name, total number of tests and total amount will be displayed. 
If any type has no requested test selected date between, these will also be displayed and their total number of test and amount will be zero.


#Page NO #7
#Unpaid Bill Report

All unpaid bill information will be displayed as following format.


