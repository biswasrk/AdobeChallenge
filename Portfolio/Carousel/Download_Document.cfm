<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>
	  
<cfquery name="qVerify">
   	SELECT DocumentName,DocumentLocation,CreateDate  from  Document 
     Where ID = #id#
      
</cfquery>


<cfhttp url="#qVerify.DocumentLocation#" 
        method="get" 
        getAsBinary="yes"
        path="c:/docs/documents" 
        file="#qVerify.DocumentName#_#session.id#.jpg"/>

<cfheader name="Content-Disposition" value="attachment; filename=#qVerify.DocumentName#_#session.id#.jpg" />
<cfcontent type="application/jpeg" file="#qVerify.DocumentLocation#" />