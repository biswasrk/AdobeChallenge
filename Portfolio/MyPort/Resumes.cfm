

<cfquery name="qVerify" >
   	SELECT ID,ResumeName,ResumeLocation,CreateDate  from  Resumes 
     Where User_Id = #session.id#
      
</cfquery>	

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Portfolio Magic  - Profile</title>
<link href="/cfPortfolio/styles/portfolio.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/cfTraining/script/jquery.js"></script>
<script type="text/javascript" src="/cfTraining/script/menu.js"></script>
</head>

<body>
<div id="wrapper">
  <div id="header"> <a href="#"><img src="/cfPortfolio/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="/cfPortfolio/images/careerhome.jpg" width="398" height="158" alt="Portfolio Magic" /><span>Portfolio Magic</span></p>
<ul>
       <li><a href="/cfPortfolio/Portfolio/Public/Help.cfm">Help</a></li>
        <li><a href="/cfPortfolio/contactUs.cfm">Contact us</a></li>
    </ul>
  </div>
  <div id="menu">
    <ul>
      <li><a href="/cfPortfolio/Index.cfm">Home</a></li>
     
    </ul>
  </div>
	<div id="pageBody">
		<h1>Portofolio Manager</h1>
		<cfform id="frm_Add_Resumes" action="Resumes_process.cfm" method="post"  enctype="multipart/form-data">
			<fieldset>
				<legend><span style="font-weight:bold; color: red;">Upload Your Resumes</span></legend>
		
				<cfinput name="fld_ID" value="#qVerify.ID#" type="hidden"/>
				<dl>		
					<!---Resume Name--->
					<dt><label for="fld_ResumeName">Resume Name</label></dt>
					<dd><cfinput Maxlength="50"  name="fld_ResumeName" id="fld_ResumeName" required="true"  message="Please, provide a Resume Name" validateAt="onSubmit" /></dd>				
				
					<dt><label> Resume[Docx Only] </label></dt>
					<dd>						
       		 <input name="FileContents" type="file"> 
       		 	
       		
      			  <br>        

					 </dd>						
	
				</dl>
				<!---Submit button--->
				<input type="submit" style="background-color: green; color: #ffffff" name="fld_UserSubmit" id="fld_UserSubmit" value="Submit" />
			</fieldset>
		</cfform>
		
		<div>
			
				<div style="left; margin-left:10px;">
			<H2>Resumes</H2>
			<TABLE CELLPADDING="3" CELLSPACING="0">
<TR BGCOLOR="#888888">
   
    <TH>Resumes Name</TH>
    <TH>Date Uploaded</TH>
   
</TR>
			<!--- Display the portfolio list of the user --->
			<cfoutput
query="qVerify">
		<TR BGCOLOR="##C0C0C0">
    <TD>#ResumeName#  </TD> 
    <TD>#CreateDate#</TD>
 
	<TD><a href="Download_Resume.cfm?id=#ID#"><img src="/cfPortfolio/images/WordIcon.gif" alt="wordlogo" name="wordlogo" width="30" height="30" id="wordlogo" />  </a> </TD>
	<td><a href="Delete_Resume.cfm?id=#ID#"> <img src="/cfPortfolio/images/trash.png" Width="30px" height="30px" alt="trash" /><a/></td>
</TR>   
</cfoutput>
</TABLE>

		</div>
			
		</div>
		
		
		
	</div>
<div id="footer">
    <p>&copy; Copyright 2016 - Portfolio Magic</p>
  </div>
</div>
</body>
</html>