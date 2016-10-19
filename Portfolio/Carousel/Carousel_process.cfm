<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>
	 
	 
<cfquery name="qVerify" datasource="PortfolioDB">
   	INSERT INTO dbo.Carousel values 
   	('#fld_DocumentId#', 
   	  #session.id#,
   	  #ID#
   	  #Now()#,
   	
	)	  


</cfquery>

<cfoutput>
	<script>       
           self.location="Carousel.cfm";
       </script>
</cfoutput>
