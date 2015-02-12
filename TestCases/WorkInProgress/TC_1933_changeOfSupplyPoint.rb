#{{{ Marathon
require_fixture 'default'
require 'modLogin'
require 'modGeneral'
require 'modCustomerEnquiry'
require 'modContractEnquiry'
require 'modHelper'
require 'modWelcome'
require 'modChangeSuppyPoint'
use_data_file('datERS.csv')
#}}} Marathon

def test

   
    #objsceurityMessag = SecurityWarningMessage.new(true)
    login = Login.new($datUsername, $datPassword)
    login.login()
    welcome = Welcome.new("Customer Enquiry")
    welcome.click()
    customer = CustomerEnquiry.new(" Customer Name", "tcs%", "501")
    customer.searchCustomerName()
    customer.setLockedBy
    customer.contract(" Live")
    contract = ContractEnquiry.new("Change Supply Point")
    contract.selection(customer.getLockedBy)
    contract.changeSupplypointWorkflow()
    
 end
