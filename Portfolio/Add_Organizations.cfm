<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>
	 
	 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Portfolio Magic  - Welcome</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/cfPortfolio/styles/portfolio.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/cfPortfolio/script/jquery.js"></script>
<script type="text/javascript" src="/cfPortfolio/script/menu.js"></script>

 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
</head>

<body>
<div id="wrapper">
  <div id="header"> <a href="#"><img src="/cfPortfolio/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="/cfPortfolio/images/careerhome.jpg" width="398" height="158" alt="Portfolio Magic" /><span>Portfolio Magic</span></p>
<ul>
       	<li><a href="siteMap.html">Site Map</a></li>
        <li><a href="contactUs.html">Contact us</a></li>
    </ul>
  </div>
  <div id="menu">
    <ul>
      <li><a href="index.cfm">Home</a></li>
     
    </ul>
  </div>
	<div id="pageBody">
		<h1>Portofolio Manager</h1>
		<cfform id="frm_Add_Portfolio" action="Add_Organizations_process.cfm" method="post">
			<fieldset>
				<legend><span style="font-weight:bold; color: red;">Create Your Job Experience</span></legend>
			<cfinput name="sessionid" type="hidden" value="#session.id#" />
				<cfinput type="hidden" name="fld_id"  
        value="#id#" /> 
        
        
				<dl>					
				
						
					<!---Organization Name--->
					<dt><label for="fld_orgname">Organization Name</label></dt>
					<dd><cfinput name="fld_orgname" id="fld_orgname" required="true"  message="Please, provide a Organization Name" validateAt="onSubmit" /></dd>
					<!---Organization Title--->
					<dt><label for="fld_orgtitle">Organization Title</label></dt>
					<dd><cfinput name="fld_orgtitle" id="fld_orgtitle" required="true"  message="Please, provide a Organization Title" validateAt="onSubmit" /></dd>

				</dl>
				<!---Submit button--->
				<input  type="submit" style="background-color: green; color: #ffffff" name="fld_UserSubmit" id="fld_UserSubmit" value="Submit" />
			</fieldset>
		</cfform>
	</div>
<div id="footer">
    <p>&copy; Copyright 2016 - Portfolio Magic</p>
  </div>
</div>
</body>
</html>