

<cfquery name="qVerify">
   	SELECT ID,DocumentName, DocumentDescription,DocumentLocation,CreateDate  from  Document 
     Where User_Id = #session.id#
      
</cfquery>	

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Portfolio Magic  - Profile</title>
<link href="/cfPortfolio/styles/portfolio.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/cfTraining/script/jquery.js"></script>
<script type="text/javascript" src="/cfTraining/script/menu.js"></script>
</head>

<body>
<div id="wrapper">
 <cfinclude
template = "/cfPortfolio/Portfolio/Common/Menu.cfm"
>
	<div id="pageBody">
		<h1>Portofolio Manager</h1>
		<cfform id="frm_Add_Resumes" action="Add_Document_process.cfm" method="post"  enctype="multipart/form-data">
			<fieldset>
				<legend><span style="font-weight:bold; color: red;">Upload Your Documents</span></legend>
		
				<cfinput name="fld_ID" value="#qVerify.ID#" type="hidden"/>
				<dl>		
					<!---Resume Name--->
					<dt><label for="fld_DocumentName">Document Name</label></dt>
					<dd><cfinput Maxlength="50"  name="fld_DocumentName" id="fld_DocumentName" required="true"  message="Please, provide a Document Name" validateAt="onSubmit" /></dd>				
				
				
				<dt><label for="fld_DocumentDesc">Document Description</label></dt>
					<dd><cfinput Maxlength="200"  name="fld_DocumentDesc" id="fld_DocumentDesc" required="true"  message="Please, provide a Document Description" validateAt="onSubmit" /></dd>				
				
					<dt><label> Document Upload[jpg Only] </label></dt>
					<dd>						
       		 <input name="FileContents" type="file"> 
       		 	
       		
      			  <br>        

					 </dd>						
	
				</dl>
				<!---Submit button--->
				<input type="submit" style="background-color: green; color: #ffffff" name="fld_UserSubmit" id="fld_UserSubmit" value="Submit" />
			</fieldset>
		</cfform>
		
		<div>
			
				<div style="left; margin-left:10px;">
			<H2>Documents</H2>
			<TABLE CELLPADDING="3" CELLSPACING="0">
<TR BGCOLOR="#888888">
   
    <TH>Document Name</TH>
    <TH>Document Description</TH>
    <TH>Date Uploaded</TH>
   
</TR>
			<!--- Display the portfolio list of the user --->
			<cfoutput
query="qVerify">
		<TR BGCOLOR="##C0C0C0">
    <TD>#DocumentName#  </TD> 
    <TD>#DocumentDescription#</TD>
    <TD>#CreateDate#</TD>
 

	 <td><a href="Download_Document.cfm?id=#ID#"> 
	 	
	 	<cfif FileExists(#DocumentLocation#)>
	 	<cfimage source="#DocumentLocation#" action="resize"
    width="10%" height="10%" name="smLogo">
 
     <cfimage source="#smLogo#" action="writeToBrowser">
     
	 	</cfif> </a> </td>
	<td><a href="Delete_Document.cfm?id=#ID#"> <img src="/cfPortfolio/images/trash.png" Width="30px" height="30px" alt="trash" /><a/></td>
</TR>   
</cfoutput>
</TABLE>

		</div>
			
		</div>
		
		
		
	</div>
<div id="footer">
    <p>&copy; Copyright 2016 - Portfolio Magic</p>
  </div>
</div>
</body>
</html>