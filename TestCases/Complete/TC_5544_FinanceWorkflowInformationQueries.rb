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
    objWFIT = WorkflowInformationTool.new("Aged Debt a")
    objWFIT.setFilter()
    objWFIT.clickSelectAndQueryButton()
    objWFIT.workflowInformationToolWindowClose()
         
end
