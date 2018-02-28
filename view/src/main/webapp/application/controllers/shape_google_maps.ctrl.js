define([ 'app' ], function(app) {
	app.controller('ShapeGoogleMapsCtrl', [ '$scope', '$window', '$http', '$location', 'commonsService', 'CrudService',
		function($scope, $window, $http, $location, commonsService, CrudService) {

		$scope.shapes = [];
		$scope.selectedShape = null;
		$scope.coordinates = [];		
		

		$scope.init = function() {
			$scope.loadShapes();
		};
		
		$scope.loadShapes = function(){
				CrudService.shape.findAllWithIdAndName().then(function(response) {
					$scope.shapes = response.data;
				}).catch(function(error) {
					console.log(error);
					commonsService.error('Error loading shapes!');
				});
		};
		
		$scope.chooseShape = function(){
			$scope.loadCoordinates($scope.selectedShape.id);
		};
		
		$scope.loadCoordinates = function(shapeId){
			
			var mapProp = {
		            center: new google.maps.LatLng(40.75597, -73.974228),
		            zoom: 12,
		            mapTypeId: google.maps.MapTypeId.ROADMAP
		        };

		        var map = new google.maps.Map(document.getElementById("map"), mapProp);

		        map.data.loadGeoJson('http://localhost:8080/google-maps-coordinate-view/geoJsonByShapeId/'+shapeId);
		};
		

	} ]);
});