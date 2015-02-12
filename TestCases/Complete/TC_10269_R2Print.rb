#{{{ Marathon
require_fixture 'default'
require 'modLogin'
require 'modGeneral'
require 'modCustomerEnquiry'
require 'modHelper'
require 'modWelcome'
require 'modPrintingR2'

use_data_file('datERS.csv')


#}}} Marathon

def test


    beforeCount = SSH(HOST, USER, PSW, KEYS, "ls /data/ers/Printed_Output/ | wc -l")
    login = Login.new($datUsername, $datPassword)
    login.login()
    welcome = Welcome.new("Printing R2")
    welcome.click()
    print = PrintingR2.new("Document Type", " POST BILL INVOICE")
    print.search()
    print.printFirstRow()


    afterCount = SSH(HOST, USER, PSW, KEYS, "ls /data/ers/Printed_Output/ | wc -l")
    sleep(5)

    doCompare(afterCount.to_i, beforeCount.to_i + 1)

end

