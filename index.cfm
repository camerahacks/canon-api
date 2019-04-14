<cfscript>
//APIs = createObject("component", "CFC/listAPI");

//AllAPIs = APIs.getAllAPIs();

//dump(AllAPIs);

//cameraAPI = createObject("component", "CFC/cameraEngine");

//live = cameraAPI.postLiveView();

//dump(live);

//deviceInfo = cameraAPI.getDeviceInfo();

//dump(deviceInfo);

//storageInfo = cameraAPI.getStorageInfo();

//dump(storageInfo);

//storageAPI = createObject("component", " CFC/storageEngine");

//directories = storageAPI.getAllContent(type='all');

//dump(directories);

//shootingAPI = createObject("component", "CFC/shootingEngine");

//shutter =  shootingAPI.tripShutter("","",false);

//dump(shutter);

systemAPI = createObject("component", "CFC/systemEngine");

command = systemAPI.intervalSequence(3,4,1);

dump(session);

</cfscript>

<!---<cfloop index="i" from="1" to="#arrayLen(directories)#">
	<cfoutput>
		<img src="#directories[i]#?kind=thumbnail">
	</cfoutput>
</cfloop>--->