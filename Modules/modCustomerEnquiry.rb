WinCustomerEnquiry = "/.*Customer Enquiry.*"
WinStatementOfAccount = "/.*Create MPAN Statement of Account.*"

class CustomerEnquiry

   # constructor method
   def initialize(type, value, slider)
      @type = type
      @value = value
      @slider = slider
   end
   # define to_s method

   def search     
     with_window(WinCustomerEnquiry) { 
       select("Search By", @type)
       select("Supply Point", "20")
       select("uk.co.edwt.frm.client.components.ETextField_0", "0005")
       select("uk.co.edwt.frm.client.components.ETextField_2", "4456")
       select("uk.co.edwt.frm.client.components.ETextField_3", "421")
       select("Max Results", @slider)
       click("SEARCH")
     }
   end

   def statementOfAccount()
    with_window(WinMasterCustomerAdministration) {
        click("iconBar", 840, 17)   
        #select("Pay Plans", "true")  

        with_window(WinStatementOfAccount) {
            select("Select / deselect all", "true")
            click("btnConfirm")
            with_window("Confirm") {
                click("OK")
            }

            with_window("Creating Account Statement(s)") {
                click("OK")
            }
        }
     }
   end
   
   def setLockedBy
     with_window(WinCustomerEnquiry) { 
       content = get_p("uk.co.edwt.frm.client.components.ETable_0","content")
       array = content.split("]")
       i = 0
       while i < array.length do
        if array[i].include? "Live"
          line = array[i]
        break
       end
       i = i + 1
       end

       @lockedBy = line.split(",")[14]
     }
   end

    def getLockedBy
     @lockedBy
    end
   
   def searchCustomerName     
  with_window(WinCustomerEnquiry) { 
    select("Search By", @type)
    select("Customer Name", @value)
    select("Max Results", @slider)
    click("SEARCH")
  }
   end
   
def searchAccountReference()
    windowName = get_window()
        with_window(windowName) {
        select("Account Reference", @value)
        select("Max Results", @slider)
         click("SEARCH")
         click("Master Customer Administration for the selected Customer")
    }
end

      def contract(status)     
  with_window(WinCustomerEnquiry) { 
    select("uk.co.edwt.frm.client.components.ETable_0", [{ "text" => status, "column" => "Status" } ])  
    puts  
     click("Contract Enquiry for the selected contract")   
  }
   end

   def verifyCustomerDetails(column, value)
    with_window(WinCustomerEnquiry) {
          content = get_p("uk.co.edwt.frm.client.components.ETable_0","content")
        count = countSubstrings(content, "Power Supply")
        count = count.to_i - 1
        count = count.to_s
        assert_p("uk.co.edwt.frm.client.components.ETable_0", "Text", value, "{" + count + ", " + column + "}")
      }
     end

end

def countSubstrings str, subStr
    return str.scan(subStr).length
end

def customerEnquiry()
    customerEnquiryIcon()
    setSearchByCustomerName()
    setCustomerName(customerName)
    setSliderMaxResults()
    clickSearch()
end

def customerEnquiryIcon()
     with_window(WinCustomerEnquiry) {
        click("09:34:55", 12, 156)
     }
end

def setSliderMaxResults()
  with_window(WinCustomerEnquiry) { 
    select("Max Results", "501")
  }
end

def setSearchBy(type)
  with_window(WinCustomerEnquiry) { 
    select("Search By", type)
  }
end

def setCustomerName(customerName)
  with_window(WinCustomerEnquiry) { 
    select("Customer Name", customerName)
  }
end

def setMPAN()
  with_window(WinCustomerEnquiry) { 
        select("Supply Point", "20")
        select("uk.co.edwt.frm.client.components.ETextField_0", "0005")
        select("uk.co.edwt.frm.client.components.ETextField_2", "4456")
        select("uk.co.edwt.frm.client.components.ETextField_3", "421")
#
#        select("Supply Point", "16")
#        select("uk.co.edwt.frm.client.components.ETextField_0", "2000")
#        select("uk.co.edwt.frm.client.components.ETextField_2", "1259")
#        select("uk.co.edwt.frm.client.components.ETextField_3", "890")
    }
end

def verifyCustomerDetails(business_name)
  puts $business_name

  
  with_window(WinCustomerEnquiry) {
        #assert_p("uk.co.edwt.frm.client.components.ETable_0", "Text", "adasd", "{14, Customer Name}")
          content = get_p("uk.co.edwt.frm.client.components.ETable_0","content")

        count = countSubstrings(content, "Power Supply")
        count = count.to_i - 1
        count = count.to_s
        assert_p("uk.co.edwt.frm.client.components.ETable_0", "Text", business_name, "{" + count + ", Customer Name}")
}
end

def clickSearch()
  with_window(WinCustomerEnquiry) { 
    click("SEARCH")
  }
end

def selectRowInSearchResults(rowNumber)
  with_window(WinCustomerEnquiry) { 
    select("uk.co.edwt.frm.client.components.ETable_0", "rows:[4],columns:[Status]")
  }
end

def selectRowInSearchResultsByStatus(status)
  with_window(WinCustomerEnquiry) { 
    select("uk.co.edwt.frm.client.components.ETable_0", [{ "text" => status, "column" => "Status" } ])   


content = get_p("uk.co.edwt.frm.client.components.ETable_0","content")

puts content
puts countSubstrings(content, "Power Supply")

puts get_p("uk.co.edwt.frm.client.components.ETable_0", "Text", "{3, Locked By}")


}

end

def doubleClickRowInSearchResults(rowNumber)
  with_window(WinCustomerEnquiry) { 
    doubleclick("uk.co.edwt.frm.client.components.ETable_0", "rows:[2],columns:[Status]")
  }
end


def clickContractEnquiry()  with_window(WinCustomerEnquiry) { 
    click("Contract Enquiry for the selected contract")
  }
end
