<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Portfolio Magic  - Welcome</title>
<link href="/cfPortfolio/styles/portfolio.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/cfPortfolio/script/jquery.js"></script>
<script type="text/javascript" src="/cfPortfolio/script/menu.js"></script>
</head>

<body>
<div id="wrapper">
  <div id="header">
  	 <a href="#"><img src="/cfPortfolio/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="/cfPortfolio/images/careerhome.jpg" Width="500px" height="108" alt="Portfolio Magic" /><span>Portfolio Magic</span></p>
<ul>
       	<cfoutput> 
          	<li><a href="/cfPortfolio/Portfolio/Public/Help.cfm">Help</a></li>
         <cfif session.allowin neq "true">
       		<li><a href="/cfPortfolio/Login.cfm">Log in</a></li>
       	</cfif>
       	
       	 <cfif session.allowin neq "false">
       		<li><a href="/cfPortfolio/Logout.cfm">Log out</a></li>
       	</cfif>
       	</cfoutput>
    </ul>
  </div>

  </div>
	<div id="pageBody">
		<h1>Wecome to your Portfolio Magic Port</h1>
		<div >
	
		Please click on the Help link to see screen shots or email biswasrk@gwu.edu
		
	</div>
<div id="footer">
	<hr/>
    <p>&copy; Copyright 2016 - Portfolio Magic</p>
  </div>
</div>
</body>
</html>