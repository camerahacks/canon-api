component output="false" displayname="Get Camera Info"  {

	public function getDeviceInfo(ip, port){

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/deviceinformation';

		requestAPI = createObject("component","CFC/httpEngine");

		deviceInfo = requestAPI.sendHTTP(method, endpoint);

		return deviceInfo;

	}

	public function getStorageInfo(ip, port){

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/devicestatus/storage';

		requestAPI = createObject("component","CFC/httpEngine");

		storageInfo = requestAPI.sendHTTP(method, endpoint);

		return storageInfo;
	}

	public function getBatteryInfo(ip, port){

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/devicestatus/battery';

		requestAPI = createObject("component","CFC/httpEngine");

		batteryInfo = requestAPI.sendHTTP(method, endpoint);

		return batteryInfo;
	}

	public function getLensInfo(ip, port){

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/devicestatus/lens';

		requestAPI = createObject("component","CFC/httpEngine");

		lensInfo = requestAPI.sendHTTP(method, endpoint);

		return lensInfo;
	}

	public function getTempInfo(ip, port){

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/devicestatus/temperature';

		requestAPI = createObject("component","CFC/httpEngine");

		tempInfo = requestAPI.sendHTTP(method, endpoint);

		return tempInfo;
	}

	public function getCopyright(ip, port){

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/functions/registeredname/copyright';

		requestAPI = createObject("component","CFC/httpEngine");

		copyright = requestAPI.sendHTTP(method, endpoint);

		return copyright;
	}

	public function putCopyright(ip, port, required info){

		method = 'PUT';

		endpoint = '/ccapi/{wild:version}/functions/registeredname/copyright';

		bodyParam = { 'copyright' = info };

		requestAPI = createObject("component","CFC/httpEngine");

		copyright = requestAPI.sendHTTP(method, endpoint, bodyParam);

		return copyright;
	}

	public function deleteCopyright(ip, port){

		method = 'DELETE';

		endpoint = '/ccapi/{wild:version}/functions/registeredname/copyright';

		requestAPI = createObject("component","CFC/httpEngine");

		copyright = requestAPI.sendHTTP(method, endpoint);

		return copyright;
	}

	public function getAuthor(ip, port){

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/functions/registeredname/author';

		requestAPI = createObject("component","CFC/httpEngine");

		author = requestAPI.sendHTTP(method, endpoint);

		return author;
	}

	public function putAuthor(ip, port, required info){

		method = 'PUT';

		endpoint = '/ccapi/{wild:version}/functions/registeredname/author';

		bodyParam = { 'author' = info };

		requestAPI = createObject("component","CFC/httpEngine");

		author = requestAPI.sendHTTP(method, endpoint, bodyParam);

		return author;
	}

	public function deleteAuthor(ip, port){

		method = 'DELETE';

		endpoint = '/ccapi/{wild:version}/functions/registeredname/author';

		requestAPI = createObject("component","CFC/httpEngine");

		author = requestAPI.sendHTTP(method, endpoint);

		return author;
	}

	public function getOwner(ip, port){

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/functions/registeredname/ownername';

		requestAPI = createObject("component","CFC/httpEngine");

		owner = requestAPI.sendHTTP(method, endpoint);

		return owner;
	}

	public function putOwner(ip, port, required info){

		method = 'PUT';

		endpoint = '/ccapi/{wild:version}/functions/registeredname/ownername';

		bodyParam = { 'ownername' = info };

		requestAPI = createObject("component","CFC/httpEngine");

		owner = requestAPI.sendHTTP(method, endpoint, bodyParam);

		return owner;
	}

	public function deleteOwner(ip, port){

		method = 'DELETE';

		endpoint = '/ccapi/{wild:version}/functions/registeredname/ownername';

		requestAPI = createObject("component","CFC/httpEngine");

		owner = requestAPI.sendHTTP(method, endpoint);

		return owner;
	}

	public function getCameraNickname(ip, port){

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/functions/registeredname/nickname';

		requestAPI = createObject("component","CFC/httpEngine");

		nickname = requestAPI.sendHTTP(method, endpoint);

		return nickname;
	}

	public function putCameraNickname(ip, port, required info){

		method = 'PUT';

		endpoint = '/ccapi/{wild:version}/functions/registeredname/nickname';

		bodyParam = { 'nickname' = info };

		requestAPI = createObject("component","CFC/httpEngine");

		nickname = requestAPI.sendHTTP(method, endpoint, bodyParam);

		return nickname;
	}

	public function deleteCameraNickname(ip, port){

		method = 'DELETE';

		endpoint = '/ccapi/{wild:version}/functions/registeredname/nickname';

		requestAPI = createObject("component","CFC/httpEngine");

		nickname = requestAPI.sendHTTP(method, endpoint);

		return nickname;
	}

	public function getDateAndTime(ip, port){

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/functions/datetime';

		requestAPI = createObject("component","CFC/httpEngine");

		datetime = requestAPI.sendHTTP(method, endpoint);

		return datetime;
	}

	public function putDateAndTime(ip, port, required info, required boolean dst){

		method = 'PUT';

		endpoint = '/ccapi/{wild:version}/functions/datetime';

		//Date needs to be RFC1123 compliant
		bodyParam = { 	
						'datetime' = info,
					 	'dst' = dst
				 	};

		requestAPI = createObject("component","CFC/httpEngine");

		datetime = requestAPI.sendHTTP(method, endpoint, bodyParam);

		return datetime;
	}

	public function deleteDateAndTime(ip, port){

		method = 'DELETE';

		endpoint = '/ccapi/{wild:version}/functions/datetime';

		requestAPI = createObject("component","CFC/httpEngine");

		datetime = requestAPI.sendHTTP(method, endpoint);

		return datetime;
	}

	public function formatCard(ip, port){

		method = 'POST';

		endpoint = '/ccapi/{wild:version}/functions/cardformat';

		requestAPI = createObject("component","CFC/httpEngine");

		cardformat = requestAPI.sendHTTP(method, endpoint);

		return cardformat;
	}

	public function getBeep(ip, port){

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/functions/beep';

		requestAPI = createObject("component","CFC/httpEngine");

		beep = requestAPI.sendHTTP(method, endpoint);

		return beep;
	}

	public function putBeep(ip, port, required info){

		method = 'PUT';

		endpoint = '/ccapi/{wild:version}/functions/beep';

		bodyParam = { 'value' = info };

		requestAPI = createObject("component","CFC/httpEngine");

		beep = requestAPI.sendHTTP(method, endpoint, bodyParam);

		return beep;
	}

}
