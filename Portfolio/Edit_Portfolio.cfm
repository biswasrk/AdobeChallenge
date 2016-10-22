
<cfquery name="DocumentQuery" >
   	SELECT ID,DocumentName,DocumentLocation,CreateDate  from  Document 
     Where User_Id = #session.id#
      
</cfquery>


<cfquery name="qVerify" >
   	SELECT ID,ResumeName,ResumeLocation,CreateDate  from  Resumes 
     Where User_Id = #session.id# 
</cfquery>	


<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	<cfset portfolioid = "#URL.id#">
	 </cfif>
	

	 <cfquery name="DisplayMission">

 	SELECT ID,MissionStatement,Highlight1,Highlight2, Highlight3,ResumeId from  Mission 
     Where User_Id = #session.id# and Portfolio_Id = #id#

</cfquery>


<cfquery name="DisplayOrganizations">

SELECT ID,Portfolio_id,OrganizationName,OrganizationPosition FROM Organization
WHERE User_Id = #session.id#  and Portfolio_Id = #id#

</cfquery>


<cfquery name="DisplaySkills">

SELECT ID,Skill,Portfolio_id FROM Skill
WHERE User_Id = #session.id#  and Portfolio_Id = #id#

</cfquery>


<cfquery name="DisplayExperience">

SELECT ID,JobTitle,Portfolio_id,JobStartDate, JobEndDate, JobDescription, JobLocation FROM Experience
WHERE User_Id = #session.id# and Portfolio_Id = #id#

</cfquery>

<cfquery name="DisplayPortfolio">
SELECT ID,PortfolioName, IsActive, CreateDate, Description FROM Portfolio
WHERE ID = #session.id#
</cfquery>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Portfolio Magic  - Welcome</title>
<link href="/cfPortfolio/styles/portfolio.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/cfTraining/script/jquery.js"></script>
<script type="text/javascript" src="/cfTraining/script/menu.js"></script>
</head>

<body>
<div id="wrapper">
  <div id="header">
  	 <a href="#"><img src="/cfPortfolio/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="/cfPortfolio/images/careerhome.jpg" Width="500px" height="108" alt="Portfolio Magic" /><span>Portfolio Magic</span></p>
<ul>
       	<cfoutput> 
       
        <li><a href="/cfPortfolio/contactUs.cfm">Contact us</a></li>
        
         <cfif session.allowin neq "true">
       		<li><a href="/cfPortfolio/Login.cfm">Log in</a></li>
       	</cfif>
       	
       	 <cfif session.allowin neq "false">
       		<li><a href="/cfPortfolio/Logout.cfm">Log out</a></li>
       	</cfif>
       	</cfoutput>
    </ul>
  </div>
  <div id="menu">
    <ul>
      <li><a href="/cfportfolio/index.cfm">Home</a></li> 
      <li><a href="#">Portfolio</a>
        <ul>
      	<li><a href="/cfPortfolio/Portfolio/MyPort/profile.cfm">Profile</a></li>    
          <li><a href="/cfPortfolio/Portfolio/MyPort/Resumes.cfm">Resumes</a></li>
          <li><a href="/cfPortfolio/Portfolio/Carousel/Add_Document.cfm"> Documents</a></li>
        </ul>
      </li>   
    </ul>
  </div>
	<div id="pageBody">
		<h1>Edit Portfolio </h1>
	
	<cflayout type="tab" name="tabLayout" style="background-color:azure;"> 
    <cflayoutarea name="tab1" title="Basic" align="left"> 
    	 <div id="calendarSideBar"  style="padding:10px;margin:10px;float:left;">
		 	<H2>Experience</H2>
		 		<br/>
		 		 	<cfoutput>
		 		 <a href="Add_Experience.cfm?id=#id#"><img src="/cfPortfolio/images/Add.png" Width="30px" height="30px" alt="Add" /></a>
		 		 </cfoutput>
		 	<ul  BGCOLOR="#C0C0C0">
		 		<cfoutput
query="DisplayExperience">	
    <li><h3>#JobTitle#</h3>   </li>
    <li style="color:brown">#LSDateFormat(JobStartDate,"mmm-dd-yyyy")#</li>
    <li>#LSDateFormat(JobEndDate,"mmm-dd-yyyy")#</li>
    <li>#JobLocation#</li>
    <a href="Edit_Experience.cfm?id=#id#"><img src="/cfPortfolio/images/pencil.png" Width="30px" height="30px" alt="edit" /></a>
   <a href="Delete_Experience_process.cfm?id=#id#"><img src="/cfPortfolio/images/trash.png" Width="30px" height="30px" alt="trash" /></a>
<hr/>
</cfoutput>
		 	</ul>		 	
	
		 </div>
		 
        	 <div id="calendarSideBar" style="padding:10px;margin:10px;float:left;">
		 		 	<H2>Organizations</H2>
		 		 	<br/>
		 		 	<cfoutput>
		 		 <a href="Add_Organizations.cfm?id=#id#"><img src="/cfPortfolio/images/Add.png" Width="30px" height="30px" alt="Add" /></a>
		 		 </cfoutput>
		 	<ul  BGCOLOR="##C0C0C0">
		 		<cfoutput
query="DisplayOrganizations">	
    <li><b>#OrganizationName#</b>   </li>
    <li>#OrganizationPosition#</li>
      <a href="Organizations/Delete_Organizations_process.cfm?id=#id#&portfolio_id=#portfolio_id#"><img src="/cfPortfolio/images/trash.png" Width="30px" height="30px" alt="trash" /></a>
    
 
<hr/>
</cfoutput>
		 	</ul>
		 	
	
		 </div>
		 	 <div id="calendarSideBar" style="margin:10px;padding:10px;float:left;">
		 		 	<H2>Skills</H2>
		 		 		<br/>
		 		 	<cfoutput>
		 		 <a href="Add_Skills.cfm?id=#id#"><img src="/cfPortfolio/images/Add.png" Width="30px" height="30px" alt="Add" /></a>
		 		 </cfoutput>
		 	<ul  BGCOLOR="##C0C0C0">
		 		<cfoutput
query="DisplaySkills">	
    <li><h3>#Skill#</h3>  </li>
       <a href="Skills/Delete_Skills_process.cfm?id=#id#&portfolio_id=#portfolio_id#"><img src="/cfPortfolio/images/trash.png" Width="30px" height="30px" alt="trash" /></a>
 
  
   
<hr/>
</cfoutput>
		 	</ul>
		 	
	
		 </div>
    </cflayoutarea> 
        <cflayoutarea name="tab2" title="Mission" align="left"> 
       
       
       <cfform id="frm_Add_Portfolio" action="Edit_Portfolio_process.cfm" method="post"  enctype="multipart/form-data" style="margin:10px;">
			<fieldset>
				<legend><span style="font-weight:bold; color: red;">Create Your Portfolio Mission/Highlights</span></legend>
			<br/>
				<cfinput name="fld_ID" value="#DisplayMission.ID#" type="hidden"/>
				<dl>		
					<!---Mission Statement--->
					<dt><label for="fld_MissionStatement">Mission Statement</label></dt>
					<dd style="padding:20px;margin:5px;"><cftextarea  richtext="yes" value="#DisplayMission.MissionStatement#" name="fld_MissionStatement" id="fld_MissionStatement" required="true" toolbar="Basic"  message="Please, provide a Mission Statement" validateAt="onSubmit" /></dd>
					<!---Highlight One--->
					<dt><label for="fld_Highlight1">Highlight One</label></dt>
					<dd><cfinput  value="#DisplayMission.Highlight1#" MaxLength="25"    name="fld_Highlight1" id="fld_Highlight1"  /></dd>
			
       		 		<!---Highlight Two--->
					<dt><label for="fld_Highlight2">Highlight Two</label></dt>
					<dd><cfinput  value="#DisplayMission.Highlight2#" MaxLength="25"   name="fld_Highlight2" id="fld_Highlight2"  /></dd>
					
					<!---Highlight Three--->
					<dt><label for="fld_Highlight3">Highlight Three</label></dt>
					<dd><cfinput  value="#DisplayMission.Highlight3#"  MaxLength="25"    name="fld_Highlight3" id="fld_Highlight3"  /></dd>
       		

					<dt>
							<div>
			
				<div style="left; margin-left:10px;">
			<H2>Resumes</H2>
			<TABLE CELLPADDING="3" CELLSPACING="0">
				<TR BGCOLOR="#888888">
   
    			<TH style="color:Gray">Resumes Name</TH>
   			 <TH style="color:Gray">Date Uploaded</TH>
   
				</TR>
			<!--- Display the portfolio list of the user --->
				<cfoutput
			query="qVerify">
			<TR BGCOLOR="##C0C0C0">
    		<TD>#ResumeName#  </TD> 
    		<TD>#CreateDate#</TD>
 
			<TD><a href="Download_Resume.cfm?id=#ID#"><img src="/cfPortfolio/images/WordIcon.gif" alt="wordlogo" name="wordlogo" width="30" height="30" id="wordlogo" />  </a> </TD>
			<td><cfinput type="Radio" checked="#qVerify.ID eq DisplayMission.ResumeId#"  name="ResumeButton" value="#ID#">#ResumeName# </td>
</TR>   
</cfoutput>
</TABLE>

		</div>
			
		</div>
					</dt>

				</dl>
				<!---Submit button--->
				<input type="submit" style="background-color: green; color: #ffffff" name="fld_UserSubmit" id="fld_UserSubmit" value="Submit" />
			</fieldset>
		</cfform>
       
    </cflayoutarea> 
      <cflayoutarea name="tab3" title="Carousel" align="left"> 
        		<div style="left; margin-left:10px;">
        			<h3>Add Images for Carousel</h3>
        			<!---<a href="Carousel/Carousel.cfm"><img src="/cfPortfolio/images/AddImage.png" alt="jpglogo" name="jpglogo" width="30" height="30" id="jpglogo" /></a>--->
        			
			<H2>Documents</H2>
			
			    <cfform id="frm_Add_Portfolio" action="Add_Carousel_process.cfm" method="post"  enctype="multipart/form-data" style="margin:10px;">
			    
			
			<TABLE CELLPADDING="3" CELLSPACING="0">
				<TR BGCOLOR="#888888">
   		<th>
    			<TH style="color:Gray">Document Name</TH>
   			 <TH style="color:Gray">Date Uploaded</TH>
   
				</TR>
			<!--- Display the Document list of the user --->
				<cfoutput
			query="DocumentQuery">
			<TR BGCOLOR="##C0C0C0">
				
    		<TD>#DocumentName#  </TD> 
    		<TD>#CreateDate#</TD>
 
				<TD><a href="Download_Document.cfm?id=#ID#"><img src="/cfPortfolio/images/jpg.png" alt="jpglogo" name="jpglogo" width="30" height="30" id="jpglogo" />  </a> </TD>
	
</TR>   
</cfoutput>
</TABLE>
</cfform>
		</div>
    </cflayoutarea> 
       <cflayoutarea name="tab4" title="Showcase" align="left"> 
        <div  style="float:left; margin-left:20px; font-size:14px;">
        	<cfoutput>
        
        	
        	<h3 style="color:brown">You can share your portfolio with prospective employers using the link above.</h3>
        		<a href="/cfPortfolio/Portfolio/Public/MyPortfolio.cfm?id=#id#&userid=#session.id#">Portfolio Link</a>
        		<a href="/cfPortfolio/Portfolio/ExportToPDF.cfm?id=#id#&userid=#session.id#">Generate PDF</a>
        	</cfoutput>
        </div>
       </cflayoutarea>
</cflayout> 
		
		
	
 
	</div>
<div id="footer">
	<hr/>
    <p>&copy; Copyright 2016 - Portfolio Magic</p>
  </div>
</div>
</body>
</html>