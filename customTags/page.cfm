<cfif thisTag.executionMode eq "start">
	<cfparam name="attributes.section" default="home" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="description" content="Clean Slide Responsive Vcard Template" />
	<meta name="keywords" content="jquery, Responsive Vcard, Template, Vcard, Clean Slide" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
	<title>Portfolio Magic</title>
	
	<!-- Loading Google Web fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=IM+Fell+DW+Pica' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css' />
	
	<!-- CSS Files -->
	<link href="/cfPortfolio/assets/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/cfPortfolio/assets/css/style.css" rel="stylesheet" type="text/css"  id="color" />
	<link href="/cfPortfolio/assets/css/typography.css" rel="stylesheet" type="text/css"  id="customFont"/>
	<link href="/cfPortfolio/assets/css/arial_content.css" rel="stylesheet" type="text/css"  id="contentfont"/>
	
	<!-- include jQuery library -->
	<script type="text/javascript" src="assets/js/jquery-1.7.min.js"></script>

	<script src="/cfPortfolio/assets/js/raphael.js" type="text/javascript"></script>
	<script src="/cfPortfolio/assets/js/init.js" type="text/javascript"></script>
</head>
	
<body>

	<!-- wrapper -->
	<div class="clr" id="top-head">&nbsp;</div>
	<div id="container">
		<!--header -->
		<div id="header" >
			<div class="logo-bg" >
				<!--logo -->
				<div class="logo">
					<img src="/cfPortfolio/images/logo.png" alt="Logo" Height="100px" border="0"  id="logo" />
				</div>
				
				<!--head right -->
				<div class="right">
				
					<!--// Navigation //-->
					<div class="menu_nav">
						<div id="nav-wrap">
							<ul class="arrowunderline" id="nav">
								<li class="home" <cfif attributes.section eq "home">id="selected"</cfif>><a href="/cfPortfolio/index.cfm">Home</a></li>
									<li><a href="/cfPortfolio/Portfolio/Public/Help.cfm">Help</a></li>
      						  <li><a href="/cfPortfolio/Contactus.cfm">Contact us</a></li>
       					  <cfif session.allowin neq "true">
       							<li><a href="/cfPortfolio/Login.cfm">Log in</a></li>
     					  	</cfif>
       	
       	 <cfif session.allowin neq "false">
       		<li><a href="/cfPortfolio/Logout.cfm">Log out</a></li>
       	</cfif>
							</ul>
						</div>
					</div>
					<!--// Navigation End //-->
				</div>
				<!--// -head right end //-->
			</div>
			<!--// logo bg end //-->
		</div>
		<!--header end -->
<cfelse>
	
				<div class="clr"></div>
			</div><!--card pattern end -->
			<div class="clr "></div>
		</div>		  <!--content end -->	
		<div class="bottom-shade"></div>
	</div>  <!--Container / wrapper end -->	
</body>
</html>
</cfif>		