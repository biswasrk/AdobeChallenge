

<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>

<cfquery name="DeleteSkill" >
	
	Delete from Skill
	where Portfolio_Id = #id#
	
</cfquery>

<cfquery name="DeleteOrganization">
	
	Delete from Organization
	where Portfolio_Id = #id#
	
</cfquery>

<cfquery name="DeleteExperience" >
	
	Delete from Experience
	where Portfolio_Id = #id#
	
</cfquery>

<cfquery name="DeleteMission">
	
	Delete from Mission
	where Portfolio_id = #id#
	
</cfquery>


<cfquery name="DeletePortfolio"  result="result">
	
	Delete from Portfolio
	where Id = #id#
	
</cfquery>

<cfif result.recordcount GT 0>
	<script>       
           self.location="/cfPortfolio/index.cfm";
       </script>
</cfif>