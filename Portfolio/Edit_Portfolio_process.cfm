<cfquery name="Mission">
	select Portfolio_id from Mission where Id = #fld_id#
</cfquery>

<cfif Not IsDefined("form.ResumeButton")>
	
	
	
	
</cfif>


<cfquery name="qVerify">
   	UPDATE Mission SET 
   	MissionStatement = '#fld_MissionStatement#',
   	Highlight1 = '#fld_highlight1#',
   	Highlight2 = '#fld_highlight2#',
   	Highlight3 ='#fld_highlight3#',   
   	ResumeId = #form.ResumeButton#,  	
   
   	User_Id = #session.id#,    	    
   	CreateDate =   #Now()# 
     where Id = #fld_id#
      
</cfquery>

<cfoutput>
	<script>       
           self.location="Edit_Portfolio.cfm?id=#Mission.Portfolio_id#";
       </script>
</cfoutput>
