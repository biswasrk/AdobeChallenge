
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
  <div id="header"> <a href="#"><img src="/cfPortfolio/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="/cfPortfolio/images/careerhome.jpg" width="398" height="158" alt="Portfolio Magic" /><span>Portfolio Magic</span></p>
<ul>
       	<li><a href="siteMap.html">Site Map</a></li>
        <li><a href="contactUs.html">Contact us</a></li>
    </ul>
  </div>
  <div id="menu">
    <ul>
      <li><a href="/cfportfolio/index.cfm">Home</a></li>
     
    </ul>
  </div>
	<div id="pageBody">
		<h1>Portofolio Manager</h1>
		<cfform id="frm_Add_Portfolio" action="Add_Portfolio_process.cfm" method="post">
			<fieldset>
				<legend><span style="font-weight:bold; color: red;">Create Your Portfolio</span></legend>
		
				
				<dl>		
					<!---Portfolio Name--->
					<dt><label for="fld_portfolioName">Portfolio Name</label></dt>
					<dd><cfinput name="fld_portfolioName" id="fld_portfolioName" required="true"  message="Please, provide a Portfolio name" validateAt="onSubmit" /></dd>
					<!---Portfolio Description--->
					<dt><label for="fld_description">Portfolio Description</label></dt>
					<dd><cfinput  name="fld_description" id="fld_description" required="true" message="Please, provide a description" validateAt="onSubmit" /></dd>
				
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