WinContractEnquiry = "/.*Contract Enquiry.*"
WinChangeOfResponsibilityDetails = "Change of Responsibility Details"
WinMasterCustomerAdministration = "/.*Master Customer Administration.*"
require 'modCustomerEnquiry'

class ContractEnquiry

   # constructor method
   def initialize(action)
      @action = action
     
   end
   # define to_s method

   def setIcon(icon)
       @icon = icon        
   end

   def clickIcon
     with_window(WinContractEnquiry) { 
        click(@action)
      }
   end
   def selection(lockedBy)   
     with_window(WinContractEnquiry) { 
        select("Actions", "true")
       # $lockedBy = "mike.gartlan"
        puts "Locked By Contract" + lockedBy
       if lockedBy.include? "mike.gartlan"
         puts "Locked by --> mike.gartlan" 
       elsif lockedBy.length > 1
         click("uk.co.edwt.frm.client.components.IconBar_1", 4, 13)
         click("uk.co.edwt.frm.client.components.IconBar_1", 4, 13)
         puts "someone else"
       else
         click("uk.co.edwt.frm.client.components.IconBar_1", 4, 13)
         puts "unlocked"
       end
         
        rightclick("uk.co.edwt.frm.client.components.IconBar_1", 1186, 19)
        select_menu(@action)
      }
   end


def disputeInvoiceWorkflow()
    with_window(WinContractEnquiry) {
    click("Add")
    click("Filter")
    showTaskfilter()
    select("Credit all disputed bills", "true")
    click("Add...")
    selectBillsunderdisputeModaldialog()
    click("Save")
    select("1", "true")
    select("edtMessage", "Disputed bill")
    click("Confirm")
    confirmDisputeModalDialog()
    click("Master Customer Administration")

}
end
   
   def maintain
     with_window(WinContractEnquiry) { 
        click("tblSites", "{0, Site Ref}")   
        click("Maintain")
        click("OK")
     }
   end

   def setContactName(contactName)
       @contactName = contactName        
   end

   def setBusinessName(businessName)
       @businessName = businessName        
   end

   def setCompanyRegNo(companyRegNo)
       @companyRegNo = companyRegNo        
   end

   def setTelephone(telephone)
       @telephone = telephone        
   end

   def setEmail(email)
       @email = email        
   end

   def setChangeOfResponsibilityDate(changeOfResponsibilityDate)
       @changeOfResponsibilityDate = changeOfResponsibilityDate        
   end

   def setNetAmount(netAmount)
       @netAmount = netAmount        
   end

   def setAdhocMessage(adhocMessage)
       @adhocMessage = adhocMessage        
   end

   def changeTenancy()
    with_window(WinChangeOfResponsibilityDetails) {
     select("Contact Name", @contactName)
     select("Business Name", @businessName)
     select("Company Reg No.", @companyRegNo)
     select("Telephone", @telephone)
     select("Email",@email)
     select("Change of Responsibility Date", @changeOfResponsibilityDate)
     click("btnSave")
     click("Yes")
     click("Yes")
     click("Close")
     with_window(WinContractEnquiry){
        click("Confirm")
        click("Yes")
        click("OK")
     }
    }
   end

   def saveAdhocCharge()
     with_window(WinContractEnquiry) { 
       click("AddAdhoc")
        with_window("Add new charge") {
         keystroke("MPAN", "Down")
         keystroke("MPAN", "Down")
         select("Net Amount", @netAmount)
         click("Save")
       }
       select("1MG", "true")
       select("edtMessageMG", @adhocMessage)
       click("Confirm")
     }
  end

    def issueAdhocCharge
    windowName = get_window()
    puts windowName
    with_window(WinContractEnquiry) {
#        click("uk.co.edwt.frm.client.components.IconBar_1", 4, 13)
#        click("uk.co.edwt.frm.client.components.IconBar_1", 4, 13)
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
  def goHome()
      windowName = get_window()
   with_window(windowName) { 
    doubleclick("Home")
   }
  end

def disputeInvoiceWorkflow_workingCopyOf_Jan23()
      with_window(WinContractEnquiry) {
        select("Actions", "true")
        rightclick("uk.co.edwt.frm.client.components.IconBar_1", 203, 13)
        select_menu("Lock this contract")
        rightclick("uk.co.edwt.frm.client.components.IconBar_1", 235, 17)
        select_menu("Disputes")
        click("Add")
        click("Filter")
        with_window("Show Task Filter") {
            select("Pending", "true")
            select("Completed", "true")
            select("Error", "true")
            click("OK")
        }

        select("Credit all disputed bills", "true")
        click("Add...")

        with_window("Select bill(s) under dispute") {
           select("tblBills", "rows:[0],columns:[MPAN Core]")
           content = get_p("tblBills", "Content")
           array = content.split("]")
          @mpan = array[0].split(",")[2]
          puts "This is MPAN Value"
          puts @mpan
          click("Dispute Bill(s)")
        }

        click("Save")
        select("1", "true")
        select("edtMessage", "Disputed bill")
        click("Confirm")

        with_window("Confirm Dispute") {
            click("OK")
        }

        click("Master Customer Administration")
    }

    #####

end

def getmpanValue
    @mpan
end


def addButton()
    with_window(WinContractEnquiry) {
    click("Add")
    }
end

def filterButton()
    with_window(WinContractEnquiry) {
    click("Filter")
    }
end

def showTaskfilter()
    with_window("Show Task Filter") {
            select("Pending", "true")
            select("Completed", "true")
            select("Error", "true")
            click("OK")
        }
 
end

def creditAllDisputesBillsRadioButton()
    with_window(WinContractEnquiry) {
        select("Credit all disputed bills", "true")
        click("Add...")
    }
end

def selectBillsunderdisputeModaldialog()
        with_window("Select bill(s) under dispute") {
           select("tblBills", "rows:[0],columns:[MPAN Core]")
          content = get_p("tblBills", "Content")
           array = content.split("]")
          @mpan = array[0].split(",")[2]
          puts "This is MPAN Value"
          puts @mpan
          click("Dispute Bill(s)")
        }
end

def saveButton()
    with_window(WinContractEnquiry) {
        click("Save")
    }
end

def confirmTab()
    with_window(WinContractEnquiry) {
        select("1", "true")
    }
end

def editboxMessage()
    with_window(WinContractEnquiry) {
        select("edtMessage", "Disputed bill")
        
    }
end

def confirmButton()
    with_window(WinContractEnquiry) {
        click("Confirm")
    }
end

def confirmDisputeModalDialog()
        with_window("Confirm Dispute") {
            click("OK")
        }
end

def clickMasterCustomerAdministrationIcon()
    with_window(WinContractEnquiry) {
       click("Master Customer Administration") 
    }
    
end
##

###
end
