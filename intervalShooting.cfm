<cfscript>

numberOfShots = URL.shots;

wait = URL.wait;

delay = URL.delay;

timeout = 2*wait*numberOfShots;

setting requesttimeout=timeout;

systemAPI = createObject("component", "CFC/systemEngine");

command = systemAPI.intervalShooting(numberOfShots, wait, delay);

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

//cameraAPI = createObject("component", "CFC/cameraEngine");

//cameraAPI.postLiveView(cameraLCD='on');

//session.focusOn = false;

//systemAPI = createObject("component", "CFC/systemEngine");

//command = systemAPI.intervalShooting(2,4,1);

//dump(session);

</cfscript>