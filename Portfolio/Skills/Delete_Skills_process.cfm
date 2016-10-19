<cfif isDefined("#URL.portfolio_id#")>
	<cfset portfolioid = "#URL.portfolio_id#">
	 </cfif>
<cfquery name="qQuery" >
    
		select Portfolio_Id from Skill
		where Id = #id#    
	</cfquery>
	
	
<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>
	 

    <cfquery name="qDelete">
    	
    	Delete Skill
    	where ID = #id#
    	
    	
    </cfquery>
    
    
<cfoutput>
	
       <script>       
           self.location="/cfPortfolio/Portfolio/Edit_Portfolio.cfm?id=#qQuery.Portfolio_Id#";
       </script>
 </cfoutput>