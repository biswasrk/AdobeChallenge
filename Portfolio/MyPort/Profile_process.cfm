<cfset directoryName = "c:\docs\">
<cfif not DirectoryExists(directoryName)> 
  <cfset DirectoryCreate(directoryName)> 
</cfif>



<cfif len(trim(form.FileContents))>
  <cffile action="upload"
     fileField="FileContents" nameConflict="Overwrite"
     destination="C:\docs\#session.id#.jpg">

</cfif>



<cfquery name="qVerify">
   	UPDATE Profile SET 
   	FirstName = '#fld_firstName#',
   	LastName = '#fld_lastName#',
   	Description ='#fld_description#',    	    
   	CreateDate =   #Now()# 
   	
        where User_Id = #session.id#
      
</cfquery>

<cfoutput>
	<script>       
           self.location="/cfPortfolio/Portfolio/MyPort/Profile.cfm";
       </script>
</cfoutput>


