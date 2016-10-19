<cfquery name="qVerify" result="result">
   	INSERT INTO Portfolio 
   	(PortfolioName,IsActive,CreateDate,Description,User_Id)
   	values 
   	( '#fld_portfolioName#',
   	  	  'Y',  
   	 #Now()#,
   	'#fld_description#',
   	 #session.id#  )
      
      
</cfquery>
<cfset NewPrimaryKey = result.generated_key>
<cfquery name="qQuery">
   	select * from  Portfolio; 
     
</cfquery>

<cfif qQuery.RecordCount>
	
	       <cfquery name="profQuery" >	
	     INSERT INTO Mission 
	     (MissionStatement, Highlight1, Highlight2, Highlight3, Portfolio_ID, User_ID, CreateDate)
       VALUES ('Mission Statement is Empty. Please Edit your Portfolio to update it.',
       '',
       '',
       '',
       #NewPrimaryKey#,
      #session.id#,
      #Now()#);
	
	</cfquery>
	
	
   	<!--- Portfolio Added --->      
       <script>       
           self.location="/cfPortfolio/index.cfm";
       </script>
   <cfelse>
   	<!--- this user did not log in correctly, alert and redirect to the login page --->
       <script>
       	alert("Error adding Portfolio, try back later!!!");
           self.location="Javascript:history.go(-1)";
       </script>
   </cfif>