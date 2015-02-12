#{{{ Marathon
require_fixture 'default'
require 'modLogin'
require 'modGeneral'
require 'modCustomerEnquiry'
require 'modContractEnquiry'
require 'modHelper'
require 'modWelcome'
require 'modMasterCustomerAdministration.rb'
use_data_file('datERS.csv')
#}}} Marathon

def test
    login = Login.new($datUsername, $datPassword)
    login.login()
    welcome = Welcome.new("Customer Enquiry")
    welcome.click()
    customer = CustomerEnquiry.new(" Customer Name", "ma", "501")
    customer.searchCustomerName()
    customer.setLockedBy
    customer.contract(" Live")
    contract = ContractEnquiry.new("Disputes")
    contract.selection(customer.getLockedBy)
    contract.disputeInvoiceWorkflow()
    #contract.selection()
    objMasterCustomerAdministration = MasterCustomerAdministration.new
    objMasterCustomerAdministration.masterCustomerAdministrationWindow()
    objMasterCustomerAdministration.verifyDisputeInvoiceContract(contract.getmpanValue)
       
end

