(function() {
	"use strict";

	angular.module("app").controller("gamesCtrl", function($scope, $http){

		$http.get("/api/v1/games.json").then(function (response)	{
			$scope.games = response.data;
		});

		$scope.addGame = function(gameTitle, gamePlayersCommitted, gamePlayersLookingFor, gameSkill, gameCourt) {
      var newGame = { title: gameTitle, court_id: gameCourt, players_committed: gamePlayersCommitted, players_looking_for: gamePlayersLookingFor, skill_level: gameSkill};
      $http.post('/api/v1/games.json', {game: newGame}).then(function(response) {
        $scope.games.push(newGame);


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

