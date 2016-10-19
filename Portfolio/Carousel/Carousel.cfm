	 
<cfquery name="DocumentQuery" datasource="PortfolioDB">
   	SELECT ID,DocumentName,DocumentLocation,CreateDate  from  dbo.Document 
     Where User_Id = #session.id#
      
</cfquery>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Portfolio Magic  - Profile</title>
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
      <li><a href="/cfPortfolio/Index.cfm">Home</a></li>
     
    </ul>
  </div>
	<div id="pageBody">
		<h1>Portofolio Manager</h1>
	<div style="left; margin-left:10px;">
			<H2>Documents</H2>
			
			    <cfform id="frm_Add_Carousel" action="Carousel_process.cfm" method="post"  enctype="multipart/form-data" style="margin:10px;">
			    
			
			<TABLE CELLPADDING="3" CELLSPACING="0">
				<TR BGCOLOR="#888888">
   		<th>
    			<TH style="color:Gray">Document Name</TH>
   			 <TH style="color:Gray">Date Uploaded</TH>
   
				</TR>
			<!--- Display the Document list of the user --->
				<cfoutput
			query="DocumentQuery">
			<TR BGCOLOR="##C0C0C0">
				<td><cfinput type="checkbox"   name="ChkDoc" value="fld_DocumentId"></td>
    		<TD>#DocumentName#  </TD> 
    		<TD>#CreateDate#</TD>
 
				<TD><a href="Download_Document.cfm?id=#ID#"><img src="/cfPortfolio/images/jpg.png" alt="jpglogo" name="jpglogo" width="30" height="30" id="jpglogo" />  </a> </TD>
	
</TR>   
</cfoutput>
</TABLE>

<input type="submit" style="background-color: green; color: #ffffff" name="fld_UserSubmit" id="fld_UserSubmit" value="Submit" />
</cfform>
</div>
	
	</div>
<div id="footer">
    <p>&copy; Copyright 2016 - Portfolio Magic</p>
  </div>
</div>
</body>
</html>