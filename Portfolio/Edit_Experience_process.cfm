<cfquery name="qQuery" >
	select Portfolio_Id from Experience
	where Id = #fld_id#
	
</cfquery>

<cfquery name="qVerify" >
   	Update Experience SET
   	 JobTitle = '#fld_jobtitle#',   	   
   	 JobStartDate = '#fld_jobstartdate#',  
   	 JobEndDate = '#fld_jobenddate#',
   	 JobDescription = '#fld_jobdescription#',  
     JobLocation = '#fld_location#'
      Where Id = #fld_id#
      
</cfquery>

<cfoutput>
	<script>       
           self.location="Edit_Portfolio.cfm?id=#qQuery.Portfolio_Id#";
       </script>
</cfoutput>


<!---<cfif qVerify.RecordCount>
   	<!--- Experience Added --->      
       <script>       
           self.location="Display_Portfolio.cfm?id= #fld_id#";
       </script>
   <cfelse>
   	<!--- this user did not log in correctly, alert and redirect to the login page --->
       <script>
       	alert("Error adding Portfolio, try back later!!!");
           self.location="Javascript:history.go(-1)";
       </script>
   </cfif>--->