<cfcomponent>
	<cfset this.name = "ccapi" >
	<cfset this.sessionmanagement = "true" >
	<cfset this.sessionTimeout = createTimeSpan(1, 0, 0, 0) >
	<cfset this.loginStorage = "session" >
	
	<!---UDF Libraries
	<cfset structAppend(request,createObject( "component", "CFC/dateUtils" )) />
	 --->

	<!---OnApplication Start Function --->
	<cffunction name="onApplicationStart" output="false">
		<!---Woocommerce Information --->
		<cfset application.ccapi = structNew()>
		<cfset application.ccapi.ip = "192.168.1.13">
		<cfset application.ccapi.port = "8080">
		<cfset application.ccapi.version = "ver100">

	</cffunction>

	<cffunction name="onSessionStart" output="false">
		<cfset session.LCDstatus = 'off'>

	</cffunction>

	<!---OnRequest Start Function --->
	<cffunction name="OnRequestStart">
    	<cfargument name = "request" required="true"/>
			<cfif isDefined("url.init")>
				<cfset onApplicationStart()>
			</cfif>
	</cffunction>
</cfcomponent>