(function() {
	"use strict";

	angular.module("app").controller("gamesCtrl", function($scope, $http){

		$http.get("/api/v1/games.json").then(function (response)	{
			$scope.games = response.data;
		});

    $http.get("/api/v1/gamed_players.json").then(function (response)  {
      $scope.gamed_players = response.data;
    });

    $http.get("/api/v1/parks.json").then(function (response)  {
      $scope.parks = response.data;
    });

		$scope.addGame = function(gameTitle, gamePlayersCommitted, gamePlayersLookingFor, gameSkill, gameCourtId, userId) {
      var newGame = { title: gameTitle, court_id: gameCourtId, players_committed: gamePlayersCommitted, players_looking_for: gamePlayersLookingFor, skill_level: gameSkill, user_id: userId};
      $http.post('/api/v1/games.json', {game: newGame}).then(function(response) {
        $scope.games.push(newGame);
        $scope.gameTitle = "";
        $scope.gamePlayersCommitted = "";
        $scope.gamePlayersLookingFor = "";
        $scope.gameSkill = "";


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

