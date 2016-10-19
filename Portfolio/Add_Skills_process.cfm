<cfquery name="qVerify">
   	INSERT INTO Skill 
   	(Skill, User_Id, Portfolio_Id, CreateDate)
   	Values
   	('#fld_skillname#',  	   
   	#NumberFormat(session.id)#,       
        #LSParseNumber(fld_id)#,
         #Now()# )
      
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