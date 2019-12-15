<cfscript>

storageAPI = createObject("component", " CFC/storageEngine");

directories = storageAPI.getAllContent(type='all');

</cfscript>

<!DOCTYPE html>
<html>
	<head>
		<title>CCAPI</title>
		<script type="text/javascript" src="js/ccapi.js"></script>
	</head>

	<body>
		<!---<button type="button" onclick="intervalometer(2,2000)">Start Shooting</button>--->

		<cfloop index="i" from="1" to="#arrayLen(directories)#">
			<cfoutput>
				<a href="" onclick="return false" ondblclick="location.href='#directories[i]#'"><img src="#directories[i]#?kind=thumbnail"></a>
			</cfoutput>
		</cfloop>
	</body>
</html>