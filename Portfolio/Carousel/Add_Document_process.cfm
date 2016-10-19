<cfset directoryName = "c:\docs\documents">
<cfif not DirectoryExists(directoryName)> 
  <cfset DirectoryCreate(directoryName)> 
</cfif>
         

<cfset FileExt=ListLast(form.FileContents,".")>

<cfif len(trim(form.FileContents))>
  <cffile action="upload"
  nameconflict="Overwrite"
     fileField="FileContents"
     destination="C:\\docs\Documents\\#fld_DocumentName#_#session.id#.jpg">

</cfif>


<cfquery name="qVerify">
   	INSERT INTO Document
   	(DocumentName, DocumentLocation, DocumentDescription, CreateDate, User_Id )
   	 values 
   	('#fld_DocumentName#',
   	'C:\\docs\\documents\\#fld_DocumentName#_#session.id#.jpg',
   	'#fld_DocumentDesc#',
   	
   	  #Now()#,
   	  #session.id#
	)	  

      
</cfquery>

<cfoutput>
	<script>       
           self.location="Add_Document.cfm";
       </script>
</cfoutput>
