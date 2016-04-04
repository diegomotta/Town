
angular.module("townsApp").factory('town', ['$http', function($http){
		
		var dataFactory = {};
		dataFactory.getCountries = function (){
			return($http({
					url: "/api/countries.json",
					method: "GET"
				}).success(function(data, status, headers, config) {
  		        	datos  = JSON.stringify(data);
  		        	return datos;
  				 })   
			);
		};

		dataFactory.getStates = function (idCountry){
			return($http({
					url: "/api/countries/"+ idCountry.toString() +"/states.json",
					method: "GET"
				}).success(function(data, status, headers, config) {
  		        	datos  = JSON.stringify(data);
  		        	console.log(datos);
  		        	return datos;
  				 })   
			);
		};

		dataFactory.getDeparments = function (idCountry,idState){
			return($http({
					url: "/api/countries/"+ idCountry.toString() +"/states/" + idState.toString()+ "/departments.json",
					method: "GET"
				}).success(function(data, status, headers, config) {
  		        	datos  = JSON.stringify(data);
  		        	return datos;
  				 })   
			);
		};		

		dataFactory.getTowns = function (idCountry,idState,idDepartment){
			return($http({
					url: "/api/countries/"+ idCountry.toString() +"/states/" + idState.toString()+ "/departments/" + idDepartment.toString() + "/towns.json",
					method: "GET"
				}).success(function(data, status, headers, config) {
  		        	datos  = JSON.stringify(data);
  		        	return datos;
  				 })   
			);
		};		


	    dataFactory.createCountry = function (stateParams) {
	      	return(
	      		$http.post('/api/countries.json', { 
	            	type : 'POST',
	            	name   : stateParams

	        	})
	     	);
	      };


	    dataFactory.createState = function (stateParams, idCountry) {
	      	return(
	      		$http.post('/api/countries/'+ idCountry.toString() +'/states.json', { 
	            	type : 'POST',
	            	name   : stateParams

	        	})
	     	);
	      };

	    dataFactory.createDepartment = function (stateParams, idCountry,idState) {
	      	return(
	      		$http.post('/api/countries/'+ idCountry.toString() +'/states/'+ idState.toString() + "/departments.json", { 
	            	type : 'POST',
	            	name   : stateParams

	        	})
	     	);
	      };

	    dataFactory.createTown = function (stateParams, idCountry,idState,idDepartment) {
	      	return(
	      		$http.post('/api/countries/'+ idCountry.toString() +'/states/'+ idState.toString() + "/departments/"+ idDepartment.toString()+ "/towns.json", { 
	            	type : 'POST',
	            	name   : stateParams

	        	})
	     	);
	      };


	    dataFactory.createAddress = function (line1, line2, longitude, latitude) {
	      	return(
	      		$http.post('/api/addresses.json', { 
	            	type : 'POST',
	            	longitude   : longitude,
	            	latitude : latitude,
	            	line_1 : line1,
	            	line_2 : line2

	        	})
	     	);
	      };

	    dataFactory.createAddress = function (first_name, last_name, document_type_id, document_number,job_address_id,home_address_id,birth_date) {
	      	return(
	      		$http.post('/api/people.json', { 
	            	type : 'POST',
	            	first_name   : first_name,
	            	last_name : last_name,
	            	document_type_id : document_type_id,
	            	document_number : document_number,
	            	job_address_id : job_address_id,
	            	home_address_id: home_address_id,
					birth_date : birth_date
	        	})
	     	);
	      };

	    dataFactory.createMunicipality = function (idCountry,idState,idDepartment,mayor_id,idTown, submayor_id, address_id) {
	      	return(
	      		$http.post('/api/countries/' +idCountry.toString() + "/states/"+ idState.toString() +"/departments/" + idDepartment.toString() +"/towns/" + idTown.toString() + '/municipalities.json', { 
	            	type : 'POST',
	            	mayor_id   : mayor_id,
	            	submayor_id : submayor_id,
	            	address_id : address_id
	        	})
	     	);
	      };

	    dataFactory.createMunicipalityEvent = function (idCountry,idState,idDepartment,mayor_id,idTown, name, description,start_date,end_date,responsible_id,contact_number,email,address_id) {
	      	return(
	      		$http.post('/api/countries/' +idCountry.toString() + "/states/"+ idState.toString() +"/departments/" + idDepartment.toString() +"/towns/" + idTown.toString() + '/municipalities/'+idMunicipality.toString()+'municipality_events.json' , { 
	            	type : 'POST',
					name : name,
					description : description,
					start_date : start_date,
					end_date : end_date,
					responsible_id : responsible_id,
					contact_number : contact_number,
					email : email,
					address_id : address_id
	        	})
	     	);
	      };


	    dataFactory.createMunicipalityEvent = function (idCountry,idState,idDepartment,mayor_id,idTown, description,start_date,end_date,responsible_id,title,email) {
	      	return(
	      		$http.post('/api/countries/' +idCountry.toString() + "/states/"+ idState.toString() +"/departments/" + idDepartment.toString() +"/towns/" + idTown.toString() + '/municipalities/'+idMunicipality.toString()+'municipality_notices.json' , { 
	            	type : 'POST',
					description : description,
					start_date : start_date,
					end_date : end_date,
					responsible_id : responsible_id,
					title : title,
					email : email,

	        	})
	     	);
	      };
		return dataFactory;	

}]);





