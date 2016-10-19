

<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>
	 
	 
	  
	 <cfquery name="DisplayDocument">

 	SELECT ID,DocumentName,DocumentLocation,DocumentDescription from  Document 
     Where User_Id = #session.id#

</cfquery>
	 
	 <cfquery name="DisplayMission">

 	SELECT ID,MissionStatement,Highlight1,Highlight2, Highlight3,ResumeId from  Mission 
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

<!DOCTYPE html>
<html>
<<head>
<meta charset="utf-8" />
<title>Portfolio Magic  - Welcome</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="/cfPortfolio/styles/portfolio.css" rel="stylesheet" type="text/css" media="screen" />
    <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 40%;
      margin: auto;
  }
  </style>
</head>
	
<cfimport taglib="/cfPortfolio/customTags/" prefix="layout" />

<layout:page section="portfolio">	
	

<div id="content">
	<div class="card-pattern">

	<div id="pageBody">
		<div class="clr">
				<div class="top-bg1">
					<div class="top-left">
						<div>
							<h1>Portfolio</h1>
						</div>
					</div> 
				</div>
				<div class="clr">
					<div class="pat-bottomleft">&nbsp;</div>
					<div class="pat-bottomright">&nbsp;</div>
				</div>
			</div>
		<div >
		<div  style="float:left; width: 300px;box-shadow: 3px 3px 3px #888888; margin-left:10px;">			
	
			<cfoutput query="DisplayProfile">
				
							<h2 style="color: Red; font-style:italic; margin:10px;"><i> #FirstName# #LastName# </i> </h2>
				<cfif FileExists("C:\docs\#session.id#.jpg")>
					<div style="float:left;">
    <cfimage source="C:\docs\#session.id#.jpg" action="resize"
    width="80%" height="80%" name="smLogo"> 
    <cfimage source="#smLogo#" action="writeToBrowser">
    
				</div>
    <cfelse>  
   				 <div>
				<img src="/cfPortfolio/images/placeholder.jpg" alt="logo" name="logo" width="150" height="150" id="placeholder" />
				</div>
				</cfif>
				<div style="float:right; word-wrap: break-word;">
				<h3 style="color: Gray; font-style:italic; margin:20px;"> #Description# </h3>
				</div>
	
			</cfoutput>
	
		</div>
		
		<div style="float: left; width:400px; margin:10px;">
				<cfoutput query="DisplayMission">
			
			<h4 style="color:black; margin:5px;"> #DisplayMission.MissionStatement# </h4>
			<img src="/cfPortfolio/images/highlights.png" alt="logo" name="logo" width="200" height="150" id="highlightlogo" />
	
			<ul>
			
				<li style="color:DarkGreen;"> <b><h2>#Highlight1#</h2></b> </li>	
				<hr/>
				<li style="color:DarkGreen;"> <b><h2>#Highlight2#</h2> </b></li>	
				<hr/>
				<li style="color:DarkGreen;"> <b><h2>#Highlight3#</h2> </b></li>	
				<hr/>
			</ul>
	
				
			</cfoutput>
			
			<div  style="margin:40px;box-shadow: 3px 3px 3px #888888; background-color: azure; padding: 10px;">
				<cfif DisplayMission.RecordCount>
					<cfif DisplayMission.ResumeId neq ''>
					<cfquery name="qResumeVerify">
   					SELECT ID,ResumeName,ResumeLocation  from  Resumes 
    			 Where Id = #DisplayMission.ResumeId#
      
					</cfquery>	
	
			<cfoutput>
				<a href="MyPort/Download_Resume.cfm?id=#qResumeVerify.ID#"><img src="/cfPortfolio/images/WordIcon.gif" alt="wordlogo" name="wordlogo" width="30" height="30" id="wordlogo" /><h2> #qResumeVerify.ResumeName# </h2> </a>
				</cfoutput>
				</cfif> 
				</cfif>
			</div>
			
		</div>
		
		</div>
		
		
		 	
		 	<div id="calendarSideBar"  style="float:left; box-shadow: 3px 3px 3px #888888; margin-left:20px;font-size:14px;">		
		 	<H2 style="color:Blue"><b>Experience</b></H2>
		 	
		 	
		 	
		 		<cfoutput
query="DisplayExperience">	
    <a style="font-size:16px; font-weight:bold; color:black;" href="Experience/Display_Experience.cfm?id=#ID#">#JobTitle#</a>
    <ul>
    <li>Start Date : #LSDateFormat(JobStartDate,"mmm-dd-yyyy")#</li>
    <li>End Date : #LSDateFormat(JobEndDate,"mmm-dd-yyyy")#</li>
    <li>Location : #JobLocation#</li>
</TR>   
<hr/>
</cfoutput>
		 	</ul>
		 	<br/>
		 	<H2 style="color:Red"><b>Organizations</b></H2>
		 		
		 		<cfoutput
query="DisplayOrganizations">	
   <b style="font-size:16px; font-weight:bold;">#OrganizationName#</b> 
   <ul >
	<li>#OrganizationPosition#  </li>
	</ul>
</TR>   
<hr/>
</cfoutput>
		 	
		 	<br/>
		 	 	<H2 style="color:Green"><b>Skills</b></H2>
		 		<ul  BGCOLOR="##C0C0C0">
		 		<cfoutput
query="DisplaySkills">	
    <li>#Skill#  </li>

</TR>   
<hr/>
</cfoutput>
		 	</ul>
		 </div>
		 
		 
		 
	
		 <hr/>
		 
		 
	</div>
	<div>
	<hr/>
	</div>
<div id="footer">
	 
		  <div style="border-color:green: border-width:medium; border-style:ridge;" id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>

    </ol>

<cfoutput query="DisplayDocument">
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

  
  	<cfif DisplayDocument.currentrow eq 1>
        <div  class="item active">  
          	 	
<cfif FileExists(#DocumentLocation#)>
					<cfimage source="#DocumentLocation#" action="resize"
    width="100%" height="100%" name="smLogo"> 
    <cfimage source="#smLogo#" action="writeToBrowser">
    
		
    
    <div class="carousel-caption">
          <h2 style="color:Yellow;">#DocumentName#</h2>
          <h2 style="color:Green;">#DocumentDescription#</h2>
        </div>
    
   </cfif>
      
      </div>
	</cfif>

      
           
    
          <div  class="item">  
          	 	
				
				<cfif FileExists(#DocumentLocation#)>
					<cfimage source="#DocumentLocation#" action="resize"
    width="100%" height="100%" name="smLogo"> 
    <cfimage source="#smLogo#" action="writeToBrowser">
    
		
    
    <div class="carousel-caption">
          <h2  style="color:Yellow;">#DocumentName#</h2>
          <h2 style="color:Green;">#DocumentDescription#</h2>
        </div>
    
   			</cfif>
      
      </div>
        
  	</cfoutput>   
    </div>


  </div>
	
	<hr/>
    <p><h3 style="color: black;">&copy; Copyright 2016 - Portfolio Magic</h3></p>
  </div>
</div>
</div>

</layout:page>
</html>