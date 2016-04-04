var townControllers = angular.module('townsApp');

townControllers.controller('myController',  ['$scope', 'town',
    function($scope, town){
    $scope.formVisibility = false;
    $scope.formVisibilityState = false;
    $scope.formVisibilityDeparment = false;
    $scope.tableRowExpanded = false;
    $scope.formVisibilityTown= false;
    $scope.tableRowIndexCurrExpanded = "";
    $scope.tableRowIndexPrevExpanded = "";
    $scope.storeIdExpanded = "";
    $scope.statesCollapse = [];
    $scope.townsCollapse = [];
    $scope.collapseDeparments = [];
    $scope.transactionShow = 0;
    $scope.states = {};
    $scope.towns = {};
    $scope.departments = {};

    function getPaises(){
        town.getCountries().success(function(response){
            $scope.countries = response;
            for (i = 0; i < $scope.countries.length ; i++) { 
                $scope.statesCollapse.push(true);;
            }
        });
      }
    function getCiudades(storeId){
        town.getStates(storeId).success(function(response){
            $scope.states = response;
            for (i = 0; i < $scope.states.length ; i++) { 
                $scope.collapseDeparments.push(true);;
            }
        });
      }
    function getDepartamentos(idCountry,idState){
        town.getDeparments(idCountry,idState).success(function(response){
            $scope.departments = response;
            for (i = 0; i < $scope.states.length ; i++) { 
                $scope.townsCollapse.push(true);;
            }
        });
      }

    function getTowns(idCountry,idState,idDepartment){
        town.getTowns(idCountry,idState,idDepartment).success(function(response){
            $scope.towns = response;
        });
      }


    $scope.crearCountry = function ()
    {
        town.createCountry($scope.country.nombre)
            .success(function () {
              console.log("EstadoCreado")
            }).
            error(function(error) {
                $scope.listo = 'Unable to insert customer: ';
            });
            getPaises()
            $scope.formVisibility= false;
    };


    $scope.createState = function (idCountry,nombre) {
        town.createState(nombre,idCountry)
            .success(function () {
              console.log("EstadoCreado")
            }).
            error(function(error) {
                $scope.listo = 'Unable to insert customer: ';
            });
            getCiudades(idCountry)
            $scope.formVisibilityState= false;
    };

    $scope.createDepartment = function (idCountry,idState,nombre) {
        console.log(idCountry,idState,nombre);
        town.createDepartment(nombre,idCountry,idState)
            .success(function () {
              console.log("Departament Creado")
            }).
            error(function(error) {
                $scope.listo = 'Unable to insert customer: ';
            });
       getDepartamentos(idCountry,idState);
    };

    $scope.createTown = function (idCountry,idState,idDepartment ,nombre){
        console.log(idCountry,idState,idDepartment ,nombre);
        town.createTown(nombre,idCountry,idState,idDepartment )
            .success(function () {
              console.log("Pueblo Creado")
            }).
            error(function(error) {
                $scope.listo = 'Error al crear el pueblo';
            });
        getTowns(idCountry,idState,idDepartment);       
    }

    $scope.ShowForm = function(){
        $scope.formVisibility= true;
    }

    $scope.ShowFormState = function(){
        $scope.formVisibilityState= true;
    }

    $scope.ShowFormDepartment = function(){
        $scope.formVisibilityDepartment= true;
      }
    $scope.ShowFormTown = function(){
        $scope.formVisibilityTown= true;
    }

    $scope.selectTableRow = function (index, storeId) {
        if ($scope.statesCollapse === 'undefined') {
            getCiudades(storeId);
        } else {

            if ($scope.tableRowExpanded === false && $scope.tableRowIndexCurrExpanded === "" && $scope.storeIdExpanded === "") {
                getCiudades(storeId);
                console.log("Entre 1");
                $scope.tableRowIndexPrevExpanded = "";
                $scope.tableRowExpanded = true;
                $scope.tableRowIndexCurrExpanded = index;
                $scope.storeIdExpanded = storeId;
                $scope.statesCollapse[index] = false;
            } else if ($scope.tableRowExpanded === true) {
                if ($scope.tableRowIndexCurrExpanded === index && $scope.storeIdExpanded === storeId) {
                    console.log("Entre 2");
                    $scope.tableRowExpanded = false;
                    $scope.tableRowIndexCurrExpanded = "";
                    $scope.storeIdExpanded = "";
                    $scope.statesCollapse[index] = true;
                    getCiudades(storeId);
                } else {
                    console.log("Entre 3");
                    $scope.tableRowIndexPrevExpanded = $scope.tableRowIndexCurrExpanded;
                    $scope.tableRowIndexCurrExpanded = index;
                    $scope.storeIdExpanded = storeId;
                    $scope.statesCollapse[$scope.tableRowIndexPrevExpanded] = true;
                    $scope.statesCollapse[$scope.tableRowIndexCurrExpanded] = false;
                    getCiudades(storeId);
                }
            }
        }
    };
    $scope.selectTableRow2 = function (index,idCountry,idState ){

        if ($scope.collapseDeparments === 'undefined'){
            getDepartamentos(idCountry,idState);   
        } else {
            if ($scope.tableRowExpanded === false && $scope.tableRowIndexCurrExpanded === "" && $scope.storeIdExpanded === "") {
                getDepartamentos(idCountry,idState);  
                $scope.tableRowIndexPrevExpanded = "";
                $scope.tableRowExpanded = true;
                $scope.tableRowIndexCurrExpanded = index;
                $scope.storeIdExpanded = idCountry;
                $scope.collapseDeparments[index] = false;
            } else if ($scope.tableRowExpanded === true) {
                if ($scope.tableRowIndexCurrExpanded === index && $scope.storeIdExpanded === idState) {
                    getDepartamentos(idCountry,idState);  
                    $scope.tableRowExpanded = false;
                    $scope.tableRowIndexCurrExpanded = "";
                    $scope.storeIdExpanded = "";
                    $scope.collapseDeparments[index] = true;
                } else {
                    getDepartamentos(idCountry,idState);  
                    $scope.tableRowIndexPrevExpanded = $scope.tableRowIndexCurrExpanded;
                    $scope.tableRowIndexCurrExpanded = index;
                    $scope.storeIdExpanded = idState;
                    $scope.collapseDeparments[$scope.tableRowIndexPrevExpanded] = true;
                    $scope.collapseDeparments[$scope.tableRowIndexCurrExpanded] = false;     
                }
            }
        }
    }      

    $scope.selectTableRow3 = function (index,idCountry,idState,idDepartment) {
        if ($scope.townsCollapse === 'undefined') {
            getTowns(idCountry,idState,idDepartment);
        } else {

            if ($scope.tableRowExpanded === false && $scope.tableRowIndexCurrExpanded === "" && $scope.storeIdExpanded === "") {
                 getTowns(idCountry,idState,idDepartment);
           
                $scope.tableRowIndexPrevExpanded = "";
                $scope.tableRowExpanded = true;
                $scope.tableRowIndexCurrExpanded = index;
                $scope.storeIdExpanded = idDepartment;
                $scope.townsCollapse[index] = false;
            } else if ($scope.tableRowExpanded === true) {
                if ($scope.tableRowIndexCurrExpanded === index && $scope.storeIdExpanded === idDepartment) {
                
                    $scope.tableRowExpanded = false;
                    $scope.tableRowIndexCurrExpanded = "";
                    $scope.storeIdExpanded = "";
                    $scope.townsCollapse[index] = true;
                     getTowns(idCountry,idState,idDepartment);
                } else {
  
                    $scope.tableRowIndexPrevExpanded = $scope.tableRowIndexCurrExpanded;
                    $scope.tableRowIndexCurrExpanded = index;
                    $scope.storeIdExpanded = idDepartment;
                    $scope.townsCollapse[$scope.tableRowIndexPrevExpanded] = true;
                    $scope.townsCollapse[$scope.tableRowIndexCurrExpanded] = false;
                    getTowns(idCountry,idState,idDepartment);
                }
            }
        }
    };


    $scope.countries = getPaises();
}]);


/*
    $scope.crearCountry = function () {
        town.createCountry($scope.country.nombre)
            .success(function () {
               getPaises()
            }).
            error(function(error) {
                $scope.listo = 'Unable to insert customer: ';
            });
    };


    $scope.createState = function () {
        town.createState($scope.state.nombre,$scope.idValor)
            .success(function () {
              console.log("EstadoCreado")
            }).
            error(function(error) {
                $scope.listo = 'Unable to insert customer: ';
            });
    };

      $scope.showStates = function(idCountry){
              $scope.states = town.getStates(idCountry).success(function(response){
               $scope.states = JSON.stringify(response);
               $scope.valor = true;
            });
      }

      $scope.createDepartment = function () {
            town.createState($scope.departmet.nombre,$scope.idValor)
                .success(function () {
                  
                }).
                error(function(error) {
                    $scope.listo = 'Unable to insert customer: ';
                });
        };

      $scope.createTown = function () {
            town.createState($scope.town.nombre,$scope.idValor)
                .success(function () {
                  
                }).
                error(function(error) {
                    $scope.listo = 'Unable to insert customer: ';
                });
        };    



      $scope.formVisibility = false;
        $scope.ShowForm = function(){
        $scope.formVisibility= true;
      }

      $scope.formVisibilityState = false;
        $scope.ShowFormState = function(idCountry){
        $scope.idValor= idCountry;
        $scope.formVisibilityState= true;
      }



    function getPaises(){
        town.getCountries().success(function(response){
              $scope.storeDataModel = response;
             for (var i = 0; $scope.storeDataModel.length - 1; i += 1) {
                $scope.statesCollapse.append('true');
            }
        });
      }


    $scope.statesCollapseFn = function () {
        for (var i = 0; $scope.storeDataModel.length - 1; i += 1) {
            $scope.statesCollapse.append('true');
        }
    };
*/