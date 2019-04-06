component output="false" displayname="List All APIs"  {

	public function init(){

		return this;
	}

	public function getAllAPIs(ip, port){

		method = 'GET';

		endPoint = '/ccapi';

		requestAPI = createObject("component","CFC/httpEngine");

		APIList = requestAPI.sendHTTP(method, endPoint);

		return APIList;

	}

}