component output="false" displayname="Get Camera Info"  {

	public function intervalSequence(numberOfShots, wait, delay){

		session.numberOfShots = arguments.numberOfShots;

		session.wait = arguments.wait*1000;

		session.sequenceNumber = 1;

		if (isDefined('arguments.delay')){

			delay = arguments.delay*1000;

			sleep(delay);
		}

		intervalShooting();

	}


	public function intervalShooting(){

		intStartTime = GetTickCount();

	
		if(session.sequenceNumber LTE session.numberOfShots){

			session.sequenceNumber = session.sequenceNumber+1;

			sleep(session.wait);

			shootingAPI = createObject("component", "CFC/shootingEngine");

			shutter =  shootingAPI.tripShutter("","",false);

			cfthread( name="intervalSequence_#session.sequenceNumber#" ){

				intervalShooting();

			}

		}else{
			session.numberOfShots = 0;

			session.sequenceNumber = 0;

			session.wait = 0;
		}

	}

}