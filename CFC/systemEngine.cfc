component output="false" displayname="Get Camera Info"  {

	public function intervalSequence(numberOfShots, wait, delay){

		session.numberOfShots = arguments.numberOfShots;

		session.wait = arguments.wait;

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

			//trip the shutter here

			cfthread( name="intervalSequence_#session.sequenceNumber#" ){

				session.a = session.a+1;

				intervalShooting();

			}

			dump(session);

			cfflush();

		}else{
			session.numberOfShots = 0;

			session.sequenceNumber = 0;

			session.wait = 0;
		}

	}

}