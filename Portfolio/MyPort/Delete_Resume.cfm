<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>
	 
<cfquery name="qVerify" >
   	SELECT ResumeName,ResumeLocation,CreateDate  from  Resumes 
     Where ID = #id#
      
</cfquery>


	 
  <cffile action="delete"
     file ="#qVerify.ResumeLocation#"
    >
    
    <cfquery name="qDelete" datasource="PortfolioDB">
    	
    	Delete dbo.Resumes
    	where ID = #id#
    	
    	
    </cfquery>
    <cfif qVerify.RecordCount>
       <script>       
           self.location="Resumes.cfm";
       </script>
    </cfif>

