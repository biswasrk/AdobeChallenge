<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>
	  
<cfquery name="qVerify" >
   	SELECT ResumeName,ResumeLocation,CreateDate  from  Resumes 
     Where ID = #id#
      
</cfquery>


<cfhttp url="#qVerify.ResumeLocation#" 
        method="get" 
        getAsBinary="yes"
        path="c:/docs/Resumes" 
        file="#qVerify.ResumeName#.docx"/>

<cfheader name="Content-Disposition" value="attachment; filename=#qVerify.ResumeName#.docx" />
<cfcontent type="application/docx" file="#qVerify.ResumeLocation#" />