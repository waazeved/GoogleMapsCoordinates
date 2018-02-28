define(['app'], function (app) {
	app.config(function ($stateProvider, $urlRouterProvider) {
		// For any unmatched url, redirect to /login
		$urlRouterProvider.otherwise("/shape_google_maps");
		//
		// Now set up the states
		$stateProvider

				.state('master', {
					templateUrl: "application/views/master/master.html",
					controller: "MasterCtrl",
					abstract: true,
					data: {
		            	requireLogin: false
		            },
					resolve: {
						loadMasterCtrl: ["$q", function ($q) {
								var deferred = $q.defer();
								require(['controllers/master.ctrl'], function () {
									deferred.resolve();
								});
								return deferred.promise;
							}],
					},
				})

				.state('shape', {
					url : '/shape_google_maps',
					templateUrl: 'application/views/shape/shape_google_maps.html',
					controller: 'ShapeGoogleMapsCtrl',
					parent: "master",
					data: {
		            	requireLogin: false
		            },
					resolve: {
						loadHomeCtrl: ["$q", function ($q) {
								var deferred = $q.defer();
								require(['controllers/shape_google_maps.ctrl'], function () {
									deferred.resolve();
								});
								return deferred.promise;
							}],
					},
				});
	});

	app.run(['$rootScope',function ($rootScope) {
		$rootScope.$on('$stateChangeStart', function (event, toState, toParams) {
			var requireLogin = toState.data.requireLogin;

			if (requireLogin && typeof sessionStorage.user === 'undefined') {
				event.preventDefault();
			}
		});
	}]);
});