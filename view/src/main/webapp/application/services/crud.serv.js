var BASE_PATH = '/google-maps-coordinate-view/';

define(['./module'], function (services) {
    services.service('CrudService', ['RestService', function (rest) {
            return {
            	shape: {
            		findAllWithIdAndName: function(search, index, limit) {
            			return rest.get(BASE_PATH + 'shape/findAllWithIdAndName');
            		}
            	},
            	coordinate: {
            		findByShapeId: function(shapeId) {
            			return rest.get(BASE_PATH + 'coordinate/findByShapeId/' + shapeId);
            		}
            	}

            };
        }]);
});