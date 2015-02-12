WinContractLoad = "/.*Contract Load.*"


def ContractLoad()
        contractLoadIconSelection()
        setContractFilesDirectory()
        setForecastDirectory()
        contractLoadValidateButton()
        loadallValidContracts()
    
end

def ContractLoad1()
        with_window("/.*- Welcome.*") {
        click("pnlStatusMessages", 178, 29)
        select_menu("Main Menu>>Contract Load")
        }
    
end

def contractLoadIconSelection()
    with_window("UAT3 (ERSUAT3B) - Welcome     Logged on as perla.bhushan") {
        click("iconBar", 20, 115)
    }

end



def setContractFilesDirectory()
    with_window(WinContractLoad) {
         select("Contract Files Directory", "")
         click("btnLookup")
         with_window("Open") {
            select("JFileChooser_0", "#M/TestData")
        }
      }
end


def setForecastDirectory()
    with_window(WinContractLoad) {
         select("Forecast Directory", "")
         click("btnLookup_2")
    with_window("Open") {
         select("JFileChooser_0", "#M/TestData")
        }
      }

end

 def contractLoadValidateButton()
      with_window(WinContractLoad) {
           click("Validate")
         }
 
 end

def loadallValidContracts()
    with_window("Confirm Load") {
            click("Load All Valid Contracts")
            select("tblContracts", "rows:[0],columns:[Validation]")
            click("plaf.metal.MetalScrollButton_0")
            click("plaf.metal.MetalScrollButton_0")
            select("tblContracts", "rows:[0],columns:[Validation]")
            select("tblContracts", "rows:[0],columns:[Validation]")
            click("Close")
        }

end
    
