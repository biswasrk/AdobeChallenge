

<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>



<cfquery name="qQuery">
    
		select Portfolio_Id from Experience
		where Id = #id#    
	</cfquery>	 

    <cfquery name="qDelete">
    	
    	Delete Experience
    	where ID = #id#
    	
    	
    </cfquery>

       <script>       
           self.location="/cfPortfolio/Portfolio/Edit_Portfolio.cfm?id=#qQuery.Portfolio_id#";
       </script>
 