<cfset variables.numIterarions = 1000 />

<cfquery name="request.getPwdAndSalt">
SELECT  ID,Password, Salt, Role_ID
FROM    PM_Users
WHERE   UserName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#fld_userEmail#" maxlength="50">
</cfquery>

<cfif request.getPwdAndSalt.RecordCount EQ 1>
    <cfif request.getPwdAndSalt.Password EQ Hash('#fld_userPassword#' & request.getPwdAndSalt.Salt, "SHA-512")>
        <cfset SessionRotate() />
       	<!--- This user has logged in correctly, change the value of the session.allowin value --->
       <cfset session.allowin = "True" />
       <cfset session.user_id = "'#fld_userEmail#'" />
       <cfset session.id = "#request.getPwdAndSalt.ID#" />
       <!--- Now welcome user and redirect to "<strong>index.cfm</strong>" --->
       <script>       
           self.location="index.cfm";
       </script>
    <cfelse>
          	<!--- this user did not log in correctly, alert and redirect to the login page --->
       <script>
       	alert("Your credentials could not be verified, please try again!!!");
           self.location="Javascript:history.go(-1)";
       </script>
    </cfif>
<cfelse>
    <!--- Bad User --->
</cfif>