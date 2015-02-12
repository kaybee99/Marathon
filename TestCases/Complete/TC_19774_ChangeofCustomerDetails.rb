#{{{ Marathon
require_fixture 'default'
require 'modLogin'
require 'modGeneral'
require 'modCustomerEnquiry'
require 'modContractEnquiry'
require 'modWelcome'
require 'modHelper'
use_data_file('datERS.csv')
#}}} Marathon

def test
    r = Random.new
    business_name = "ACME" + r.rand(10 ** 10).to_s
    login = Login.new($datUsername, $datPassword)
    login.login()
    welcome = Welcome.new("Customer Enquiry")
    welcome.click()
    customer = CustomerEnquiry.new(" Supply Point", "2000054456421", "501")
    customer.search()
    customer.setLockedBy
    customer.contract(" Live")
    contract = ContractEnquiry.new("Change Of Tenancy")
    contract.selection(customer.getLockedBy)
    contract.maintain()
    contract.setContactName("Mike")
    contract.setBusinessName(business_name)
	contract.setCompanyRegNo("12345")
    contract.setTelephone("028931231231")
    contract.setEmail("mg@acme.com")
    contract.setChangeOfResponsibilityDate("23/12/2014")
    contract.changeTenancy()
    contract.goHome()
    welcome = Welcome.new("Customer Enquiry")
    welcome.click()
    customer = CustomerEnquiry.new(" Supply Point", "2000054456421", "501")
    customer.search()
    customer.verifyCustomerDetails("Customer Name", business_name)

end
