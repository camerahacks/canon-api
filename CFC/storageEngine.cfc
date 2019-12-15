component output="false" displayname="Process Storage Info"  {

	public function getDirectoryList(storage){

		if (NOT isDefined('arguments.storage')){
			storage = 'sd';
		}else{
			storage = arguments.storage;
		}

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/contents/'&storage;

		requestAPI = createObject("component","CFC/httpEngine");

		directoryList = requestAPI.sendHTTP(method, endpoint);

		return directoryList;

	}

	public function getDirectoryContents(storage, directory, type, kind, order, page){

		if (NOT isDefined('arguments.storage')){
			storage = 'sd';
		}else{
			storage = arguments.storage;
		}

		if (NOT isDefined('arguments.type')){
			urlParam.type = 'all';
		}else{
			urlParam.type = arguments.type;
		}

		if (NOT isDefined('arguments.kind')){
			urlParam.kind = 'list';
		}else{
			urlParam.kind = arguments.kind;
		}

		if (isDefined('arguments.order') AND (arguments.kind IS 'chunked')){
			urlParam.order = arguments.order;
		}

		if (isDefined('arguments.page') AND (kind = 'list')){
			urlParam.page = page;
		}

		method = 'GET';

		endpoint = '/ccapi/{wild:version}/contents/'&storage&'/'&directory;

		requestAPI = createObject("component","CFC/httpEngine");

		directoryContent = requestAPI.sendHTTP(method=method, endpoint=endpoint, urlParam=urlParam);

		return directoryContent.url;

	}

	public function getAllContent(type, kind){

		if (NOT isDefined('arguments.type')){
			type = 'all';
		}else{
			type = arguments.type;
		}

		if (NOT isDefined('arguments.kind')){
			kind = 'list';
		}else{
			kind = arguments.kind;
		}

		allDir = getDirectoryList();

		dirArray = allDir.url;

		content = arrayNew();

		for(i=1; i<=arrayLen(dirArray); i++){
			
			dir = listLast(dirArray[i], "/");

			dirContent = getDirectoryContents(directory=dir, type=type, kind=kind);

			content = arrayMerge(content, dirContent) ;

		}

		return content;

	}

	public function getContent(required mediaAddress){

		method = 'GET';

		endpoint = arguments.mediaAddress;

		requestAPI = createObject("component","CFC/httpEngine");

		content = requestAPI.sendHTTP(method, endpoint);

		return content;

	}

}
