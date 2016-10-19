  <div id="header"> <a href="#"><img src="/cfPortfolio/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="/cfPortfolio/images/careerhome.jpg" width="398" height="158" alt="Portfolio Magic" /><span>Portfolio Magic</span></p>
<ul>
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
  <div id="menu">
    <ul>
      <li><a href="/cfPortfolio/index.cfm">Home</a></li>
     
    </ul>
  </div>