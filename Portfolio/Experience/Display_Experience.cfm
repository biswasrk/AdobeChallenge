<cfquery name="qQuery" datasource="PortfolioDB">
    
		select Portfolio_Id from dbo.Experience
		where Id = #id#    
	</cfquery>
<cfif isDefined("#URL.id#")>
	<cfset id = "#URL.id#">
	 </cfif>

<cfquery name="GetExperience"
datasource="PortfolioDB">
SELECT JobDescription FROM dbo.Experience
WHERE ID = #id# 
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
       
        <li><a href="contactUs.html">Contact us</a></li>
        
         <cfif session.allowin neq "true">
       		<li><a href="Login.cfm">Log in</a></li>
       	</cfif>
       	
       	 <cfif session.allowin neq "false">
       		<li><a href="Logout.cfm">Log out</a></li>
       	</cfif>
       	</cfoutput>
    </ul>
  </div>
  <div id="menu">
    <ul>
      <li><a href="index.cfm">Home</a></li>
      <li><a href="Career.html">Career</a></li>
     
    </ul>
  </div>
	<div id="pageBody">
		<h1>Wecome to your Portfolio Magic</h1>
		<div >
	
		
		<div style="left; margin-left:10px;">
			<H2>Job Description</H2>
<cfoutput query="GetExperience">	
#jobdescription#
				
</cfoutput>


		</div>
		</div>
		<div>
			<cfoutput>
				<a href="/cfPortfolio/Portfolio/Display_Portfolio.cfm?id=#qQuery.Portfolio_Id#"><img src="/cfPortfolio/images/backbutton.png" alt="backbutton" name="backbutton" width="30" height="30" id="wordlogo" />  </a>
				</cfoutput>
		</div>
		
	</div>
<div id="footer">
	<hr/>
    <p>&copy; Copyright 2016 - Portfolio Magic</p>
  </div>
</div>
</body>
</html>