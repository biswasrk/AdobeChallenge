

   <!--- Generate users credentials --->

<cfset variables.salt = Hash(GenerateSecretKey("AES"), "SHA-512") /> 
<!--- could use Rand("SHA1PRNG") instead of GenerateSecertKey() --->

<cfset variables.hashedPassword = Hash('#fld_userPassword#' & variables.salt, "SHA-512") />
<!--- insert both variables.salt and variables.hashedPassword into table --->


   <cfquery name="qVerify"  result="result">
   	INSERT INTO PM_Users 
   	(UserName, Password, Role_id, Salt)
   	Values
   	('#fld_userEmail#',
   	  '#variables.hashedPassword#',    
        1, '#variables.salt#' )   
            
</cfquery>


<cfset NewPrimaryKey = result.generated_key >

<cfif NewPrimaryKey neq ''>
   	<!--- This user has logged in correctly, change the value of the session.allowin value --->
       <cfset session.allowin = "True" />
       <cfset session.user_id = '#fld_userEmail#' />
       <cfset session.id = NewPrimaryKey />
       
       <cfquery name="profQuery"  >	
	     INSERT INTO Profile
	     (User_Id, FirstName, LastName, Description, CreateDate) values
	     
      (#session.id#,'','','', #Now()#)
	
</cfquery>


       <!--- Now welcome user and redirect to "<strong>index.cfm</strong>" --->
       <script>
       	alert("Welcome user, successfully Logged in!");
           self.location="/cfPortfolio/index.cfm";
       </script>
   < cfelse>
   	<!--- this user did not log in correctly, alert and redirect to the login page --->
       <script>
       	alert("Your credentials could not be verified, please try again!!!");
           self.location="Javascript:history.go(-1)";
       </script>
   </cfif>
