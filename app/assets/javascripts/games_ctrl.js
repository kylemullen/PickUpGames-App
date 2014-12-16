(function() {
	"use strict";

	angular.module("app").controller("gamesCtrl", function($scope, $http){

		$http.get("/api/v1/games.json").then(function (response)	{
			$scope.games = response.data;
		});

    $scope.setupGame = function(gameId, userId) {
      $scope.gameId = gameId;
      $scope.userId = userId;
      $scope.game = {gamed_players: []};

      $http.get("/api/v1/games/" + gameId + ".json").then(function (response)  {
        $scope.game = response.data;
      });
    };

    

    // $http.get("/api/v1/gamed_players.json").then(function (response)  {
    //   $scope.gamed_players = response.data;
    // });

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



    $scope.addGamedPlayer = function (userId, gameId, playersBringing) {
      var newGamedPlayer = { user_id: userId, game_id: gameId, players_bringing: playersBringing};
      $http.post('/api/v1/gamed_players.json', {gamed_player: newGamedPlayer}).then(function(response)
          {
            if($scope.playerIsSignedOn(userId)) {
              $scope.game.gamed_players.push(newGamedPlayer);
              $scope.playersBringing = "";
            } else {

            }
          
          }, function (error) {
            $scope.errors = error.data.errors;
          });

    };

    $scope.playerIsSignedOn = function(userId) {
      console.log(userId);

      var signedOn = false
      for(var i = 0; i < $scope.game.gamed_players.length; i++) {
          console.log($scope.game.gamed_players[i].user_id)
        if($scope.game.gamed_players[i].user_id == userId) {
          signedOn = true;
        }
      }
      return signedOn;


    }



    // $scope.gamedPlayersInGame = function(gameId) { 
    //   $http.get("/api/v1/games/#{gameId}.json").then(function (response) {
    //   $scope.gamedPlayersInGame = response.data;
    //   }
    //   }

    
    
    $scope.changeOrder = function(attribute) {
      $scope.orderAttribute = attribute;
      $scope.sortDirection = !$scope.sortDirection;
    };



		window.scope = $scope;

	 });

	}());

