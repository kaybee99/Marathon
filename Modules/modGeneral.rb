WinMain = "/.*Logged on as.*"
WinContractEnquiry = "/.*Contract Enquiry.*"
WinMasterCustomerAdmin = "/.*Master Customer Administration.*"
require_fixture 'default'

require 'net/ssh'

HOST = '10.125.4.135'
USER = 'ersuat'
PSW = 'ersuat'
FROM_DIR = '/data/ers/Printed_Automatic/'
TO_DIR = '/home/marathon/'
local_path = "C:/Marathon_Automation"
CMD = "ls /data/ers/Printed_Output/ | wc -l"
#test
KEYS = [ "-----BEGIN RSA PRIVATE KEY-----
MIIEoQIBAAKCAQEAqItzIg66yT07cWWzl3DPCS2j7Ska6qADS14ZOyKxU6L0NA6T
X+KjNI18TPA7zXSo61GqsB+iU7s0yV/iVzg0YYSTnCkNnpnE+eOoLV2KCqkEfNOb
AgDNadF8gQDnfXDF0MLAnErouaEKWzH62nSQtnQME9P5NTmQzKF5JLe+feCVsgbw
kZwNIbb1/Hny0dIFK9f9OkBzePiUdOsC/hkcyjz5YVm8E+pdlUJrjVgPE5cO0BSt
nByGc8Mo3atIabqyxzQe7ujbsALzgwrLFLQoXHDv9EdseTsTRzKWhujQAVJZDgAY
74tpqpZyXUiYmBU6TzpXGv3PrLtXjH95GhFd/wIBIwKCAQA+mjIT9tep1Ooxburv
G0WVsd3NHeVtFtym9xCvkIsBzs+7kGKf9RgMNI1BJgeVdHlBdhrTs/p23yI8Ku2r
XgTTw4dIoYi3QG275tgQ2ZmsMCY8/iOhqIbPiFLQ1HM9OIP9FSL4ORScuChrA+91
tkRhBogknzCtXoY9YIwU88ppRC87nvxCpwLdxGltk+9JUlXIYLJwDTo/+PfionlR
LbUH4aK03ws2V2NsKu1dE4Khwt5Y814Y9eyJ+o+SldW3BUEW+OVyoe387/K6cCEc
4KuXQ7wKkE+txBRfdM47ZMo0rxG222zpkWGSgBkcTWQfMk2uMe2oDtS0OeZ79s9h
u2sbAoGBAN4lQej/SusDSl41fde/pEUpwPD5eZC0tdcbwDtTBJ5DcQ+B2qK8Roe2
IYQvdtb4CPjb61LRien1B97rxwykvH+Ka6lP+12eyTTmwjinFl9T0rKO3Xn61uOm
yV61BPpSGnaxoxine3B8DW/kHJewGehKZk5AYJVYMYAExFPXdYAnAoGBAMI7BUy3
e8uh+VSMRm90KLGriN0TGW1TGpgeYahuD5cizuUMOknsuI8eXo+yDycs95fw/JiH
XvhGU8dnPSPEjZewKlqlYOmjUUTNuDlHQOddrMz6NC+qj1s886oeSqGXh+2+0ynT
OcsaQ9KPb1XPEW0v13VROji+FVdNrIDFVIJpAoGBAJH7OfDiRyy5BPwUheWMkIU4
sf1wvZmbUuxxUnAgnKKEFxjRrO6Y+yX7V9qFlzzO4VMULO1H3klJP6+/gs3LV0x/
iJPVeUwmhDi05gf4xY8Z05no2q8+b/SvbmLOuiDW3jC94DTF1MZC5EI20PX3YXtk
F1f+a1rTjj4vBKwf34AZAoGAFjKhhRxIqY7aqpOwR0B5ree33sBarWiVUzasEz/H
RHkBs8biFxO9Ui9bQ59SMFzpGK3TuakSKwC5HhptYyxn9BQiGPz1IgQJSbEcXlFJ
PwNkNK7hZIiFaYNPDCC4Ene3w2ZEBMeu1WIWYTT2x/poZD/7Xd1lvVeNaRAw+MYY
SWsCgYBHU2mSrOF3vGftdgRCynmxUwaxYSVuA2i2uUkAt/BlVi/Cv4V5/HQtEoJj
oQ6oM2iYUyyfpzO0AIm/OURl70ut+TJlsP4oa/jmp4l5EyD7yxPuXTGfUyk5rBs8
+o2OU4SlC+5u4X3UQGIiIoRP1P1nXSmQkGBn2YWYVCQLYuJHsQ==
-----END RSA PRIVATE KEY-----
"]



def navigateCustomerEnquiry()
  with_window(WinMain) { 
    rightclick("iconBar", 1, 1)
    select_menu("Customer Enquiry")
  }
end

def goHome()

  with_window(WinContractEnquiry) { 
  doubleclick("Home")
  }
end

def printAdhocCharge()
    with_window("/.*Master Customer Administration.*") {
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

def AdhocChargeSetText(adHocText)

    with_window(WinContractEnquiry) {
#        select("Actions", "true")
#        rightclick("uk.co.edwt.frm.client.components.IconBar_1", 1186, 19)
#        select_menu("Ad Hoc Charges")




            click("Add")

            with_window("Add new charge") {
                select("MPAN", " 2000000073281")
                select("Net Amount", "100.00")
                click("Save")
            }

        select("1", "true")
        select("edtMessage", adHocText)
        click("Confirm")

#            select("Confirm", "true")
#            select("edtMessage", adHocText)
#            click("btnConfirm")
            
        }

# Read in the bash environment, after an optional command.
#   Returns Array of key/value pairs.
def bash_env(cmd=nil)
  env = `#{cmd + ';' if cmd} printenv`
  env.split(/\n/).map {|l| l.split(/=/)}
end

# Source a given file, and compare environment before and after.
#   Returns Hash of any keys that have changed.
def bash_source(file)
  Hash[ bash_env(". #{File.realpath file}") - bash_env() ]
end

# Find variables changed as a result of sourcing the given file, 
#   and update in ENV.
def source_env_from(file)
  bash_source(file).each {|k,v| ENV[k] = v }
end

end
