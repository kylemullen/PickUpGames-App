json.id game.id
json.title game.title
json.court_id game.court_id
json.players_committed game.players_committed
json.players_looking_for game.players_looking_for
json.skill_level game.skill_level
json.status game.status
json.user_id game.user_id
json.gamed_players game.gamed_players.each do |gamed_player|
	json.user_id gamed_player.user.id
	json.email gamed_player.user.email
	json.first_name gamed_player.user.first_name
	json.last_name gamed_player.user.last_name
	json.players_bringing gamed_player.players_bringing
end