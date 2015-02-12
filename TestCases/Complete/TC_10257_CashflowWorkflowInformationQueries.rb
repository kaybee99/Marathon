#{{{ Marathon
require_fixture 'default'
require 'modLogin'
require 'modGeneral'
require 'modCustomerEnquiry'
require 'modContractEnquiry'
require 'modHelper'
require 'modWelcome'
require 'modMasterCustomerAdministration'
require 'modWorkflowInformationTool'
use_data_file('datERS.csv')
#}}} Marathon

def test
    login = Login.new($datUsername, $datPassword)
    login.login()
    welcome = Welcome.new("Workflow Information Tool")
    welcome.click
    workflowInfor = WorkflowInformationTool.new("Cashflow Detail R")
    #reportname = objWFIT.instance_variable_get(:@reportName)
    workflowInfor.setFilter()
    workflowInfor.clickSelectAndQueryButton()
    workflowInfor.getCSANamefromCSVfile()
    csa = workflowInfor.instance_variable_get(:@csaName)
    csa = csa.upcase
    workflowInfor.getCustomerAccountNumberfromCSVFile()
    workflowInfor.clickSaveAsCSVbutton()
    workflowInfor.workflowInformationToolWindowClose()
    contract = ContractEnquiry.new(nil)
    contract.goHome()     
    welcome = Welcome.new("Customer Enquiry")
    welcome.click()
    custAccount = workflowInfor.instance_variable_get(:@custAccount)
    customer = CustomerEnquiry.new("Account Reference", custAccount, "501")
    customer.searchAccountReference() 
    masterCustAdmin = MasterCustomerAdministration.new
    masterCustAdmin.verifyCSAnameonMasterCustomerAdminstrationWindow(csa)
    contract.goHome()
    welcome = Welcome.new("Workflow Information Tool")
    welcome.click
    workflowInfor = WorkflowInformationTool.new("Cashflow Summary Report")
    workflowInfor.setFilter()
    workflowInfor.clickSelectAndQueryButton()
    workflowInfor.clickSaveAsCSVbutton()
    workflowInfor.workflowInformationToolWindowClose
    workflowInfor.workflowInformationToolWindowClose
    
end
