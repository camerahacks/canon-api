component output="false" displayname="Send HTTP Request"  {

	public function init(){

		return this;
	}

	public function RFC3986(required string stringToEncode){
		stringToEncode = replacelist(urlencodedformat(stringToEncode),"%2D,%2E,%5F,%7E","-,.,_,~");
		
		return stringToEncode;
	}

	public function sendHTTP(required method, required endpoint, bodyParam, urlParam, ip, port){
		
		if (NOT isDefined('arguments.ip')){
			ip = application.ccapi.ip;
		}

		if (NOT isDefined('arguments.port')){
			port = application.ccapi.port;
		}

		version = application.ccapi.version;

		valueReplace = version;

		endpoint = replaceList(arguments.endpoint, '{wild:version}', valueReplace);

		urlString = "http://"&ip&":"&port&arguments.endPoint;

		httpService = new http(method = arguments.method, url = urlString);

		if (isDefined('arguments.urlParam')){

			keys = StructKeyArray(urlParam);

			//Loop through URL params to add to the request
			for(i=1; i <= ArrayLen(keys); i++){
				paramKey = RFC3986(LCase(keys[i]));
				paramValue = RFC3986(urlParam[keys[i]]);
	    		httpService.addParam(name = paramKey, type = 'URL', value = urlParam[keys[i]]);
	    	}
    	}

		if (isDefined('arguments.bodyParam')){
			
			bodyParam = serializeJSON(arguments.bodyParam);

			httpService.addParam(type = 'body', value = bodyParam);
		}

		httpRequest = httpService.send().getPrefix();

		if(isjSON(httpRequest.filecontent)AND(httpRequest.status_code IS '200')){
			return deserializeJSON(httpRequest.filecontent);	
		} else {
			return httpRequest;
		}

	}

}