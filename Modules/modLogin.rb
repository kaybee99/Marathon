WinLogin = "/.*- Login.*"

class Login

   # constructor method
   def initialize(username, password)
      @username, @password = username, password
   end
   # define to_s method

   def login     
     with_window("/.*- Login.*") { 
      select("txtUsername", @username)
      select("txtPassword", @password)
      click("btnLogin")
      }
   end
end
