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
  <script>
  $( function() {
    $( "#fld_jobstartdate" ).datepicker();
    $( "#fld_jobenddate" ).datepicker();
    
    
  } );
  
  function testlen(field,maxlen,msg,showval){
   /*
   Validates maxlength for a CFFORM CFTEXTAREA richtext field. 
   Created by Charlie Arehart, carehart.org, 8/1/2008
   - field (required): name of rich textarea field on form to validate (case sensitive!)
   - maxlen (required): the maximum length to be permitted for the length of the textarea body (including generated html)
   - msg (optional): a message to be shown to the user, or empty string ('') to show a default message defined as "defaultmsg" below
   - showval (option): if 'yes', will show the actual generated body as part of the message
   */
   var body = ColdFusion.getElementValue(field);
   var defaultmsg = 'The ' + field + ' field must be less than ' + maxlen + ' characters.'
   // test textarea body length    if (body.length > maxlen) {
      // if no message is passed in, create a default one (the onsubmit in cfform seems to require all args be passed, so 3rd arg can't be left out, but an be set to '')       if (msg.length < 1) msg=defaultmsg;
      // show the current value, if requested       if (showval == 'yes') msg=(msg + '\nCurrent value (with HTML) is:\n' + body)
      alert(msg)
      return (false);
   }

  </script>

  
  
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
      <li><a href="/cfPortfolio/index.cfm">Home</a></li>
     
    </ul>
  </div>
	<div id="pageBody">
		<h1>Portofolio Manager</h1>
		<cfform id="frm_Add_Portfolio" action="Add_Experience_process.cfm" method="post">
			<fieldset>
				<legend><span style="font-weight:bold; color: red;">Create Your Job Experience</span></legend>
			<cfinput name="sessionid" type="hidden" value="#session.id#" />
				<cfinput type="hidden" name="fld_id"  
        value="#id#" /> 
        
        
				<dl>					
				
						
					<!---Experience Job Title--->
					<dt><label for="fld_jobtitle">Job Title</label></dt>
					<dd><cfinput name="fld_jobtitle" id="fld_jobtitle" required="true"  message="Please, provide a Job Title" validateAt="onSubmit" /></dd>
					<!---Experience Description--->
					<dt><label for="fld_jobdescription">Job Description</label></dt>
					<dd><cftextarea validate="maxlength"  richtext="yes"   maxlength="1000"    name="fld_jobdescription" id="fld_jobdescription" required="true" message="Please, provide a description" validateAt="onSubmit" /></dd>
				
					<dt><label for="fld_jobstartdate">Job Start Date</label></dt>
					<dd><cfinput  name="fld_jobstartdate" id="fld_jobstartdate" required="true" message="Please, provide a job start date" validateAt="onSubmit" /></dd>
				
				<dt><label for="fld_jobenddate">Job End Date</label></dt>
					<dd><cfinput  name="fld_jobenddate" id="fld_jobenddate" required="true" message="Please, provide a job end date" validateAt="onSubmit" /></dd>
				
				<dt><label for="fld_location">Job Location</label></dt>
					<dd><cfinput  name="fld_location" id="fld_location" required="true" message="Please, provide a job location" validateAt="onSubmit" /></dd>
				
				
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