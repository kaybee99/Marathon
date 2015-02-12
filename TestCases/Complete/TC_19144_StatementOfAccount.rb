#{{{ Marathon
require_fixture 'default'
require 'modLogin'
require 'modGeneral'
require 'modCustomerEnquiry'
require 'modContractEnquiry'
require 'modHelper'
require 'modWelcome'
use_data_file('datERS.csv')
#}}} Marathon

def test

    beforeCount = SSH(HOST, USER, PSW, KEYS, "ls /data/ers/Printed_Output/*statement* | wc -l")
    login = Login.new($datUsername, $datPassword)
    login.login()
    welcome = Welcome.new("Customer Enquiry")
    welcome.click()
    customer = CustomerEnquiry.new(" Customer Name", "cs", "501")
    customer.searchCustomerName()
    customer.setLockedBy
    customer.contract(" Live")
    contract = ContractEnquiry.new("Master Customer Administration")
    contract.clickIcon()
    customer.statementOfAccount()    
    sleep(5)
    afterCount = SSH(HOST, USER, PSW, KEYS, "ls /data/ers/Printed_Output/*statement* | wc -l")
    doCompare(afterCount.to_i, beforeCount.to_i)

end
