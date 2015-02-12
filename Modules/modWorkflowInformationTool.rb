
class WorkflowInformationTool

     def initialize(reportName)
         @reportName = reportName
        
     end

     def setFilter()
         windowName = get_window()
             with_window(windowName) {
             select("Filter", @reportName)
         }
     end

     def clickSelectAndQueryButton()
         windowName = get_window()
          with_window(windowName) {
                 click("Select And Query...")
                 sleep(5)
         }
     end
     
     def workflowInformationToolWindowClose()
         windowName = get_window()
         puts windowName
         with_window(windowName) {
             window_closed(windowName)
             sleep(5)
         
         }

     end

     def clickSaveAsCSVbutton()
         windowName = get_window()
           with_window(windowName) {
               click("Save as CSV...")
                sleep(2)
                with_window("Save") {
                select("JFileChooser_0", "#H/Documents/@Csm_Cashflow_Detail.csv")
            }

            with_window("File @Csm_Cashflow_Detail.csv exists!") {
                click("OK")
            }
        }
    
     end 

     def getCSANamefromCSVfile()
            windowName = get_window()
               with_window(windowName) {
                select("tblResults", "rows:[0],columns:[CSA_USER_NAME]")
                 p = get_p("tblResults", "Content[0][3]")
                 @csaName = p.to_s
                 }
         end

     def getCustomerAccountNumberfromCSVFile()
            windowName = get_window()
               with_window(windowName) {
                 select("tblResults", "rows:[0],columns:[CUSTOMER_ACCOUNT]")
                 p = get_p("tblResults", "Content[0][4]")
                 @custAccount = p.to_s
                }
      end

      def selectCustomerEnquiryIconOnWorkflowInforWindow()
          windowName = get_window()
               with_window(windowName) {
                 
                }
      end

end



