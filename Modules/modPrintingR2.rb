WinPrintingR2 = "/.*- Printing R2.*"

class PrintingR2

   # constructor method
   def initialize(type, value)
      @type = type
      @value = value
   end
   # define to_s method

   def search     
    with_window(WinPrintingR2) {
        select(@type, @value)
        click("Search")
    }
   end

   def printFirstRow
    with_window(WinPrintingR2) {
        select("Rows Returned: 50", "rows:[0],columns:[Document Type]")
        click("Print")
          with_window("Confirm Print 1 of 1") {
            click("btnConfirm")
        }
        with_window("Batches Printed") {
            click("OK")
        }
    }
   end   
   
end
