
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
		<cfset session.allowin = "false" />
       <cfset session.user_id = "0" />
 <cfinclude template="/cfPortfolio/Portfolio/Common/Menu.cfm">
	<div id="pageBody">
		<cflogout> 
		<h1>Thank you for using Portfolio Magic Port, You are logged out!</h1>
	
	</div>
<div id="footer">
    <p>&copy; Copyright 2016 - Portfolio Magic</p>
  </div>
</div>
</body>
</html>