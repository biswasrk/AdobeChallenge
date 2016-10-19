<cfquery name="qQuery" datasource="PortfolioDB">
    
		select Portfolio_Id from dbo.Organization
		where Id = #id#    
	</cfquery>

<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>
	 

    <cfquery name="qDelete" datasource="PortfolioDB">
    	
    	Delete dbo.Organization
    	where ID = #id#
    	
    	
    </cfquery>
<cfoutput>
       <script>       
         
             self.location="/cfPortfolio/Portfolio/Edit_Portfolio.cfm?id=#qQuery.Portfolio_Id#";
       </script>
</cfoutput>