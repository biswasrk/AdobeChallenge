<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>
	 
<cfquery name="qVerify" >
   	SELECT DocumentName,DocumentLocation,CreateDate  from  Document 
     Where ID = #id#
      
</cfquery>


	 
  <cffile action="delete"
     file ="#qVerify.DocumentLocation#"
    >
    
    <cfquery name="qDelete">
    	
    	Delete dbo.Document
    	where ID = #id#
    	
    	
    </cfquery>
    <cfif qVerify.RecordCount>
       <script>       
           self.location="Add_Document.cfm";
       </script>
    </cfif>
