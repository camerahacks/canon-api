component output="false" displayname="Get Camera Info"  {

	public function intervalSequence(numberOfShots, wait, delay){

		session.numberOfShots = arguments.numberOfShots;

		session.wait = arguments.wait*1000;

		session.sequenceNumber = 1;

		if (isDefined('arguments.delay')){

			delay = arguments.delay*1000;

			sleep(delay);
		}

		cameraAPI = createObject("component", "CFC/cameraEngine");

		cameraAPI.postLiveView();

		intervalShooting();

	}


	public function intervalShooting(){

		//intStartTime = GetTickCount();

	
		if(session.sequenceNumber LTE session.numberOfShots){

			sleep(session.wait);

			shootingAPI = createObject("component", "CFC/shootingEngine");

			shutter =  shootingAPI.tripShutter("","",session.focusOn);

			session.sequenceNumber = session.sequenceNumber+1;

			intervalShooting();

		}else{

			cameraAPI = createObject("component", "CFC/cameraEngine");

			liveview = cameraAPI.postLiveView(cameraLCD='on');

			dump(liveview);

			session.numberOfShots = 0;

			session.sequenceNumber = 0;

			session.wait = 0;
		}

	}

}