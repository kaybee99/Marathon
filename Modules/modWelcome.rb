WinWelcome = "/.*Logged on as.*"

class Welcome

   # constructor method
   def initialize(selection)
      @selection = selection
   end
   # define to_s method

   def click     
    with_window(WinWelcome) {
        rightclick("iconBar", 1, 1)
        select_menu(@selection)
    }
   end

   def navigateCustomerEnquiry()
  with_window(WinMain) { 
    rightclick("iconBar", 1, 1)
    select_menu("Customer Enquiry")
  }
end
end
