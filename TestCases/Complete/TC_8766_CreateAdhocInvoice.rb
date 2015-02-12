#{{{ Marathon
require_fixture 'default'
require 'modLogin'
require 'modGeneral'
require 'modCustomerEnquiry'
require 'modContractEnquiry'
require 'modHelper'
require 'modWelcome'
require 'modMasterCustomerAdministration'
use_data_file('datERS.csv')

#}}} Marathon

def test
    beforeCount = SSH(HOST, USER, PSW, KEYS, "ls /data/ers/Printed_Automatic/ | wc -l")
    r = Random.new
    login = Login.new($datUsername, $datPassword)
    login.login()
    welcome = Welcome.new("Customer Enquiry")
    welcome.click()
    customer = CustomerEnquiry.new(" Customer Name", "cs", "501")
    customer.searchCustomerName()
    customer.setLockedBy
    customer.contract(" Live")
    contract = ContractEnquiry.new("Ad Hoc Charges")
    contract.selection(customer.getLockedBy)
    contract.setNetAmount("100")
    contract.setAdhocMessage("This is an ahoc charge with reference" + r.rand(10 ** 10).to_s)
    puts "This is an ahoc charge with reference" + r.rand(10 ** 10).to_s
    contract.saveAdhocCharge()
    master = MasterCustomerAdministration.new()
    contract.issueAdhocCharge()

    sleep(20)
    afterCount = SSH(HOST, USER, PSW, KEYS, "ls /data/ers/Printed_Automatic/ | wc -l")


    puts "before " + beforeCount
    puts "after " + afterCount
    doCompare(afterCount.to_i, beforeCount.to_i+2)
    
    
end
