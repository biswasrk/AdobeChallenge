

<cfquery name="qVerify">
   	SELECT ID,FirstName,LastName,Description, Image from  Profile 
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

<cfinclude
template = "/cfPortfolio/Portfolio/Common/Menu.cfm"
>
  
  
  
  
	<div id="pageBody">
		<h1>Portofolio Manager</h1>
		<cfform id="frm_Add_Portfolio" action="Profile_process.cfm" method="post"  enctype="multipart/form-data">
			<fieldset>
				<legend><span style="font-weight:bold; color: red;">Create Your Profile</span></legend>
		
				<cfinput name="fld_ID" value="#qVerify.ID#" type="hidden"/>
				<dl>		
					<!---First Name--->
					<dt><label for="fld_firstName">First Name</label></dt>
					<dd><cfinput value="#qVerify.FirstName#" name="fld_firstName" id="fld_firstName" required="true"  message="Please, provide a Firstname" validateAt="onSubmit" /></dd>
					<!---Last Name--->
					<dt><label for="fld_lastName">Last Name</label></dt>
					<dd><cfinput  value="#qVerify.LastName#"  name="fld_lastName" id="fld_lastName" required="true"  message="Please, provide a Lastname" validateAt="onSubmit" /></dd>
					<!---Profile Description--->
					<dt><label for="fld_description">Profile Description</label></dt>				
				<dd><cftextarea  value="#qVerify.Description#"   richtext="yes" toolbar="Basic"    name="fld_description" id="fld_description" required="true" /></dd>
				
				
					<dt><label> Image [Please make sure that c:\docs folder is created] </label></dt>
					<dd>						
       		 <input name="FileContents" type="file"> 
       		 	
       		
      			  <br>        

					 </dd>
					 <dd>			

    <cftry>  
    	<cfif FileExists("C:\docs\#session.id#.jpg")>
    <cfimage source="C:\docs\#session.id#.jpg" action="resize"  
    width="25%" height="25%" name="smLogo"> 
    	
<cfimage source="#smLogo#" action="writeToBrowser">
</cfif>
 <cfcatch type = "Database"> 
 	
   </cfcatch> 
</cftry>

					 </dd>
					 </dd>
				</dl>
				<!---Submit button--->
				<input type="submit" style="background-color: green; color: #ffffff" name="fld_UserSubmit" id="fld_UserSubmit" value="Submit" />
			</fieldset>
		</cfform>
	</div>
<div id="footer">
    <p>&copy; Copyright 2016 - Portfolio Magic</p>
  </div>
</div>
</body>
</html>