component output="false" displayname="Image Storage Handling"  {

	public function getStorageList(ip, port){

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/contents';

		requestAPI = createObject("component","CFC/httpEngine");

		storage = requestAPI.sendHTTP(method, endpoint);

		return storage;

	}

}
