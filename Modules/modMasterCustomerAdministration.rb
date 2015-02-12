WinMasterCustomerAdministration = "/.*Master Customer Administration.*"
require 'modContractEnquiry'

class MasterCustomerAdministration

  def issueAdhocCharge
    with_window(WinMasterCustomerAdministration) {
        click("Master Customer Administration")
        select("Billing", "true")
        with_window("Customer Billing Filter") {
            click("OK")
        }
        select("Billing", "true")
        select("tblAppIssBills", "rows:[0],columns:[Site Name]")
        click("Set Ready & Issue")
        with_window("Confirm Issue Bills") {
            click("btnConfirm")
        }
        with_window("Information") {
            click("OK")
        }
    }
   end

def masterCustomerAdministrationWindow() 
        windowName = get_window()
        puts windowName    
       with_window(windowName) {
            select("Ledger", "true")
        }

end


def verifyDisputeInvoiceContract(mpan)
    puts "MPAN Value 1"
    puts mpan
    windowName = get_window()
    puts windowName    
    with_window(windowName) {
       content = get_p("tblTransactions_5","Content")
        count = countSubstrings(content, "Credit Note")
        count = count.to_i - 1
        count = count.to_s
        assert_p("tblTransactions_5", "Text", mpan, "{" + count + ", MPAN}")
      }
end


def verifyCSAnameonMasterCustomerAdminstrationWindow(csa)
        windowName = get_window()
        with_window(windowName) {
        select("Customer", "true")
        select("tblAccountRoles", "rows:[0],columns:[User]")
        assert_p("tblAccountRoles", "Text", csa, "{0, User}")
        #assert_p("tblAccountRoles", "Text", "Clare Garner", "{0, User}")
        select("Ledger", "true")
        click("Filter...")
          with_window("Transaction Filter") {
            select("Unallocated", " All")
            click("OK")
        }

     }
end    


end
