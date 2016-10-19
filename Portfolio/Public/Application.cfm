<!--- Create the application --->
   <cfapplication name="PortfolioMagic"
   	clientmanagement="Yes"
   	datasource='learncfinaweektest'
       sessionmanagement="Yes"
       sessiontimeout="#CreateTimeSpan(0,0,15,0)#"
       applicationtimeout="#CreateTimeSpan(0,2,0,0)#" />