
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
  <cfinclude template="/cfPortfolio/Portfolio/Common/Menu.cfm">
	<div id="pageBody">
		<h1>Login</h1>
		<cfform id="frm_UserLogin" action="login_process.cfm" method="post">
			<fieldset>
				<legend>Your profile</legend>
				<!---Output error messages if any--->
				
				<!---Output feedback message if form has been successfully submitted--->
				
				<dl>		
					<!---E-Mail Address text field--->
					<dt><label for="fld_userEmail">E-mail Address</label></dt>
					<dd><cfinput name="fld_userEmail" id="fld_userEmail" required="true" validate="email" message="Please, provide a valid e-mail Address" validateAt="onSubmit" /></dd>
					<!---Password text field--->
					<dt><label for="fld_userPassword">Password</label></dt>
					<dd><cfinput type="password" name="fld_userPassword" id="fld_userPassword" required="true" message="Please, provide a password" validateAt="onSubmit" /></dd>
					<dt><label for="fld_userPasswordConfirm">Confirm password</label></dt>
					<dd><cfinput type="password" name="fld_userPasswordConfirm" id="fld_userPasswordConfirm" required="true" message="Please, confirm your password" validateAt="onSubmit" /></dd>
					
				</dl>
				<!---Submit button--->
				<input type="submit" name="fld_UserSubmit" id="fld_UserSubmit" value="Submit" />
				
				<div>
					<h2>Or</h2>
					<a href="/cfPortfolio/Portfolio/Public/Create.cfm"> Create Account </a>
				</div>
			</fieldset>
		</cfform>
	</div>
<div id="footer">
    <p>&copy; Copyright 2016 - Portfolio Magic</p>
  </div>
</div>
</body>
</html>