<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>
	 
	 	 <cfquery name="DisplayDocument">

 	SELECT ID,DocumentName,DocumentLocation,DocumentDescription from  Document 
     Where User_Id = #session.id#

</cfquery>
	 
	 <cfquery name="DisplayMission">

 	SELECT ID,MissionStatement,Highlight1,Highlight2, Highlight3,ResumeId,CreateDate from  Mission 
     Where Portfolio_Id = #id#

</cfquery>

<cfquery name="DisplayProfile">

 	SELECT ID,FirstName,LastName,Description, Image from  Profile 
     Where User_Id = #session.id#

</cfquery>
	

<cfquery name="DisplayExperience">

SELECT ID,JobTitle,JobStartDate, JobEndDate, JobDescription, JobLocation FROM Experience
WHERE User_Id = #session.id#  and Portfolio_Id = #id#

</cfquery>

<cfquery name="DisplayOrganizations">

SELECT ID,OrganizationName,OrganizationPosition FROM Organization
WHERE User_Id = #session.id#  and Portfolio_id = #id# 

</cfquery>


<cfquery name="DisplaySkills">

SELECT ID,Skill FROM Skill
WHERE User_Id = #session.id#   and Portfolio_id = #id# 

</cfquery>

<cfquery name="DisplayPortfolio">
SELECT ID,PortfolioName, IsActive, CreateDate, Description FROM Portfolio
WHERE ID = #id#
</cfquery>


	<cfdocument format="pdf" name="myGeneratedPDF">
		
		<cfoutput>
		<cfdocumentitem type="header">
			<h1 style="text-align:center;">#DisplayProfile.FirstName# &nbsp #DisplayProfile.LastName#</h1>
		</cfdocumentitem>	
		<p>
			
		<h1><u>Professional Summary</u></h1>
			#DisplayMission.MissionStatement#
		</p>
		<p>	
			</cfoutput>
			<h1><u>Experience</u></h1>
			
			<cfoutput query="DisplayExperience">		
		<h2> #DisplayExperience.JobTitle#  #dateformat(DisplayExperience.JobStartDate,'mm/dd/yyyy')#  #dateformat(DisplayExperience.JobEndDate,'mm/dd/yyyy')#  #DisplayExperience.JobLocation#</h2>
		<h2> #DisplayExperience.JobDescription# </h2>
	</cfoutput>
	
		<h1><u>Skills</u></h1>
	
		<cfoutput query="DisplaySkills">		

		<h2> #DisplaySkills.Skill# </h2>
			</cfoutput>
			<h1><u>Organizations</u></h1>
			<cfoutput query="DisplayOrganizations">		

		<h3> #DisplayOrganizations.OrganizationName# -
			#DisplayOrganizations.OrganizationPosition# </h3>
			</cfoutput>
		</p>		
		
	</cfdocument>	
	<cfpdf action="addWatermark" source="myGeneratedPDF" image="watermark.jpeg" foreground="yes" overwrite="yes" />
	<cfcontent variable="#toBinary(myGeneratedPDF)#" type="application/pdf" /> 
