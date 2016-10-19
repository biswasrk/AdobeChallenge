<cfquery name="qQuery">
    
		select Portfolio_Id from Experience
		where Id = #fld_id#    
	</cfquery>
	
	
<cfquery name="qVerify">
   	INSERT INTO Experience
   	(JobTitle, JobStartDate, JobEndDate, JobDescription, JobLocation, User_Id, CreateDate, Portfolio_Id)
   	 Values
   	('#fld_jobtitle#',   	   
   	  # CreateODBCDateTime(fld_jobstartdate)#, 
   	  # CreateODBCDateTime(fld_jobenddate)#, 
   	  '#fld_jobdescription#',  
       '#fld_location#',
       #NumberFormat(session.id)#,
        #Now()# ,
        #LSParseNumber(fld_id)# )
      
</cfquery>

<cfoutput>
	<script>       
           self.location="Edit_Portfolio.cfm?id=#fld_id#";
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