component output="false" displayname="Shutter Release"  {

	public function tripShutter(ip, port, af){

		method = 'POST';

		endpoint = '/ccapi/{wild:version}/shooting/control/shutterbutton';

		requestAPI = createObject("component","CFC/httpEngine");

		params = structNew();

		params = { "af":arguments.af };

		shutter = requestAPI.sendHTTP(method, endpoint, params);

		return shutter;

	}

}