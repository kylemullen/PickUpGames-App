(function() {
	"use strict";

	angular.module("app").controller("gamesCtrl", function($scope, $http){

		$http.get("/api/v1/games.json").then(function (response)	{
			$scope.games = response.data;
		});

		$scope.addgame = function(gameTitle, gameCourt, gamePlayers) {
      var newgame = { name: gameTitle, court: gameCourt, players: gamePlayers};
      $http.post('/api/v1/games.json', {game: newgame}).then(function(response) {
        $scope.games.push(newgame);
        $scope.gameTitle = "";
        $scope.gamePlayers = "";
        

        }, function (error) {
          $scope.errors = error.data.errors;
        });
           
      

    };
    
    $scope.changeOrder = function(attribute) {
      $scope.orderAttribute = attribute;
      $scope.sortDirection = !$scope.sortDirection;
    };



		window.scope = $scope;

	 });

	}());

