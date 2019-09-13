component output="false" displayname="Get Camera Info"  {

	public function intervalShooting(numberOfShots, wait, delay){

		session.numberOfShots = arguments.numberOfShots;

		session.wait = arguments.wait*1000;

		session.sequenceNumber = 1;

		if (isDefined('arguments.delay')){

			delay = arguments.delay*1000;

			sleep(delay);
		}

		//Turn off the LCD to save energy
		if(session.LCDstatus IS 'off'){
			cameraAPI = createObject("component", "CFC/cameraEngine");

			cameraAPI.postLiveView(session.LCDstatus);
		}

		//Start shooting the sequence
		session.isIntActive = true;

		intervalSequence();

		return "Interval shooting started";

	}


	public function intervalSequence(){

		//Continue if there are shots remaining
		if(session.sequenceNumber LTE session.numberOfShots){

			sleep(session.wait);

			shootingAPI = createObject("component", "CFC/shootingEngine");

			shutter =  shootingAPI.tripShutter("","",session.focusOn);

			session.sequenceNumber = session.sequenceNumber+1;

			//This loop can go on for a while. Putting a safety switch to cancel shooting.
			if(NOT isDefined('application.cancelAll')){
				intervalSequence();
			}

		}else{

			cameraAPI = createObject("component", "CFC/cameraEngine");

			//Turn on the LCD when done shooting
			liveview = cameraAPI.postLiveView(cameraLCD='on'); 

			session.numberOfShots = 0;

			session.sequenceNumber = 0;

			//Flag as done shooting
			session.isIntActive = false;

		}

	}

	public function cancelInterval(){

		//setting the number of shots to zero will cancel the interval loop
		//This is user/session level switch
		session.numberOfShots = 0;

		return session.numberOfShots;

	}

	public function setLCDPref (required LCDstatus='off'){

		session.LCDstatus = arguments.LCDstatus;

		return "LCD will be "&session.LCDstatus&" during shooting.";

	}

}