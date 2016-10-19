<!--- Create the application --->
   <cfapplication name="PortfolioMagic"
   	clientmanagement="Yes"
   	datasource='learncfinaweektest'
       sessionmanagement="Yes"
       sessiontimeout="#CreateTimeSpan(0,0,15,0)#"
       applicationtimeout="#CreateTimeSpan(0,2,0,0)#" />
   

   <CFPARAM NAME="session.allowin" DEFAULT="false" /> 
   <CFPARAM NAME="session.folderpath" DEFAULT="/cfPortfolio/Docs" />   
     
     <cftry>
    <cfparam name="session.id" type="numeric" default="0" />
    <cfcatch>
    <cfset FORM.user_type_id = 0 />
    </cfcatch>
</cftry>

   <CFPARAM NAME="session.user_id" DEFAULT="0" />
   
   <!--- Now if the variable "session.allowin" does not equal true, send user to the login page --->
   <!--- the other thing you must check for is if the page calling this application.cfm is the "login.cfm" page and the "Login_process.cfm" page since the Application.cfm is always called, if this is not checked the application will simply Loop over and over. To check that, you do the following call --->
   
   <cfif session.allowin neq "true">
   	<cfif  ListLast(CGI.SCRIPT_NAME, "/") EQ "login.cfm">
       <cfelseif ListLast(CGI.SCRIPT_NAME, "/") EQ "login_process.cfm">
       <cfelse>
       	<!--- this user is not logged in, alert user and redirect to the login.cfm page---> 
           <script>           
               self.location="login.cfm";
           </script>
       </cfif>
   </cfif>
