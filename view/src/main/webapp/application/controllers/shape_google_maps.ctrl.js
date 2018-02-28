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
			CrudService.coordinate.findByShapeId(shapeId).then(function(response) {
				$scope.coordinates = response.data;
				console.log($scope.coordinates);
				$scope.initMap();
			}).catch(function(error) {
				console.log(error);
				commonsService.error('Error loading shapes!');
			});
		};
		
		$scope.initMap = function() {
			var geoJson = '{"type": "FeatureCollection", "features": [ { "type": "Feature", "properties": { "fillColor": "red"  }, "geometry":	{"type":"MultiPolygon",	"coordinates":[[[<COORDINATES>]]]}';
			var coordinates = '';
			for(var i = 0; i < $scope.coordinates.length;i++){
				coordinates = coordinates + '['+$scope.coordinates[i].longitude + ','+ $scope.coordinates[i].latitude + ']';
			}
			geoJson = geoJson.replace('<COORDINATES>',coordinates);
			geojson = geojson + '}     ]    };';
			var geojson = JSON.parse(geoJson);
			console.log(geoJson);
			var data = geojson;

		        var mapProp = {
		            center: new google.maps.LatLng(40.75597, -73.974228),
		            zoom: 12,
		            mapTypeId: google.maps.MapTypeId.ROADMAP
		        };

		        var map = new google.maps.Map(document.getElementById("map"), mapProp);

		        map.data.addGeoJson(data);
	      }

	} ]);
});