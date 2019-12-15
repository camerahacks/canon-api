<cfcomponent>
	<cfset this.name = "ccapi" >
	<cfset this.sessionmanagement = "true" >
	<cfset this.sessionTimeout = createTimeSpan(1, 0, 0, 0) >
	<cfset this.loginStorage = "session" >
	
	<!---UDF Libraries--->
	<cfset structAppend(request, createObject("component", "CFC/listAPI"))>

	<!---OnApplication Start Function --->
	<cffunction name="onApplicationStart" output="false">
		<!---Woocommerce Information --->
		<cfset application.ccapi = structNew()>
		<cfset application.ccapi.ip = "192.168.1.22">
		<cfset application.ccapi.port = "8080">
		<cfset application.ccapi.version = "ver100">

	</cffunction>

	<cffunction name="onSessionStart" output="false">
		<cfset session.LCDstatus = 'off'>
		<cfset session.ccapiStart = request.getAllAPIs(application.ccapi.ip, application.ccapi.port)>

	</cffunction>

	<!---OnRequest Start Function --->
	<cffunction name="OnRequestStart">

    	<cfargument name = "request" required="true"/>
			<cfif isDefined("url.init")>
				<cfset onApplicationStart()>
				<cfset onSessionStart()>
			</cfif>
	</cffunction>
</cfcomponent>