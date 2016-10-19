<cfquery name="GetPortfolio">
SELECT ID,PortfolioName, IsActive, CreateDate, Description FROM Portfolio
WHERE User_Id = #session.id# 
</cfquery>

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
       
        <li><a href="Contactus.cfm">Contact us</a></li>
        
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
      <li><a href="#">My Port</a>
        <ul>
        	<li><a href="Portfolio/MyPort/profile.cfm">Profile</a></li>    
          <li><a href="Portfolio/MyPort/Resumes.cfm">Resumes</a></li>
          <li><a href="Portfolio/Carousel/Add_Document.cfm"> Documents</a></li>
        </ul>
      </li>
      <li><a href="Portfolio/portfolioweb.cfm"> My Websites </a></li>
    </ul>
  </div>
	<div id="pageBody">
		<h1>Wecome to your Portfolio Magic Port</h1>
		<div >
		<div style="float:left">
			
		<a href="./Portfolio/Add_Portfolio.cfm"><img src="/cfPortfolio/images/AddPortfolio.png" alt="portfolilogo" name="portfolilogo" width="128" height="121" id="logo" /></a>
		
		</div>
		
		<div style="float:right; margin-left:10px;">
			<H2>Portfolio Records</H2>
			<TABLE CELLPADDING="3" CELLSPACING="0">
<TR BGCOLOR="#888888">
   
    <TH>Portfolio Name</TH>
    <TH>Is Active?</TH>
    <TH>Date Created</TH>
    
     <TH>Description</TH>
</TR>
			<!--- Display the portfolio list of the user --->
			<cfoutput
query="GetPortfolio">
		<TR BGCOLOR="##C0C0C0">
    <TD><a href="Portfolio/Display_Portfolio.cfm?id=#ID#">#PortfolioName#</a>   </TD>
    <TD>#IsActive#</TD>
    <TD>#CreateDate#</TD>
    <TD>#Description#</TD>
	<TD><a href="Portfolio/Edit_Portfolio.cfm?id=#ID#"><img src="/cfPortfolio/images/pencil.png" alt="pencillogo" name="pencillogo" width="30" height="30" id="pencillogo" />  </a> </TD>
	<TD><a href="Portfolio/Delete_Portfolio.cfm?id=#ID#"><img src="/cfPortfolio/images/trash.png" alt="deletelogo" name="deletelogo" width="30" height="30" id="deletelogo" />  </TD>
	
</TR>   
</cfoutput>
</TABLE>

		</div>
		</div>
	</div>
<div id="footer">
	<hr/>
    <p>&copy; Copyright 2016 - Portfolio Magic</p>
  </div>
</div>
</body>
</html>