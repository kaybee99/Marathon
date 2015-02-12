#{{{ Marathon
require_fixture 'default'
require 'modLogin'
require 'modGeneral'
require 'modCustomerEnquiry'
require 'modContractEnquiry'
require 'modHelper'
use_data_file('datERS.csv')
#}}} Marathon

def test
    r = Random.new
    $business_name = "ACME" + r.rand(10 ** 10).to_s
    login($datUsername, $datPassword)
    navigateCustomerEnquiry()
    setSliderMaxResults()
    setSearchBy(" Supply Point")   
    setMPAN() 
    clickSearch()
    selectRowInSearchResultsByStatus(" Live")
    clickContractEnquiry()
    selectContractActionChangeOfTenancy($business_name)
    goHome()
    navigateCustomerEnquiry()
    setSearchBy(" Supply Point")   
    setMPAN()
    clickSearch()
    verifyCustomerDetails($business_name)

end
