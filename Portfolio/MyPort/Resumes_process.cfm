
<cfset directoryName = "c:\docs\Resumes">
<cfif not DirectoryExists(directoryName)> 
  <cfset DirectoryCreate(directoryName)> 
</cfif>

<cfset FileExt=ListLast(form.FileContents,".")>

<cfif len(trim(form.FileContents))>
  <cffile action="upload" nameconflict="Overwrite"
     fileField="FileContents"
     destination="C:\\docs\\Resumes\\#fld_ResumeName#.docx">

</cfif>



<cfquery name="qVerify" >
   	INSERT INTO Resumes 
   	(ResumeName,ResumeLocation,CreateDate,User_Id)
   	values 
   	('#fld_ResumeName#',
   	'C:\\docs\\Resumes\\#fld_ResumeName#.docx',
   	  #Now()#,
   	  #session.id#
	)	  

      
      
</cfquery>

<cfoutput>
	<script>       
           self.location="Resumes.cfm";
       </script>
</cfoutput>


