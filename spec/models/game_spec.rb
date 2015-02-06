require 'rails_helper'

describe Game do
	describe 'email' do
		it 'should return the email of the user that created the game' do
			game = Game.new(:title => "Game 2", :user_id => 1)
			game.user = User.new(:id => 1, :email => "myemail@email.com")
			expect(game.email).to eq("myemail@email.com")
		end
	end		
	describe 'park_name' do
		it 'should return the name of the park that is where the game is taking place' do
			game = Game.new(:title => "Game 2", :court_id => 1)
			game.court = Court.new(:id => 1, :park_id => 1)
			game.court.park = Park.new(:id => 1, :name => "The Park")
			expect(game.park_name).to eq("The Park")
			end
	end

	describe 'gamed_players_total' do
		it 'should return the total numbers of additional players signed up for a certain game and add it to the number of players originally signed up' do
			game = Game.new(:id => 1, :title => "Game 1", :players_committed => 6)
			game.gamed_players << GamedPlayer.new(:game_id => 1, :user_id => 2, :players_bringing => 2)
			expect(game.gamed_players_total).to eq(8)
			end
	end

	describe 'signed_up_players' do
		it 'should return the total numbers of additional players signed up for a certain game that doesnt include the initial creator' do
			game = Game.new(:id => 1, :title => "Game 1", :players_committed => 1)
			game.gamed_players << GamedPlayer.new(:game_id => 1, :user_id => 2, :players_bringing => 2)
			game.gamed_players << GamedPlayer.new(:game_id => 1, :user_id => 4, :players_bringing => 4)
			expect(game.signed_up_players).to eq(6)
			end
	end

	describe 'game_full?' do
		it 'should return if the game is full or not' do
			game = Game.new(:id => 1, :title => "Game 2", :players_looking_for => 4)
			game.gamed_players << GamedPlayer.new(:game_id =>1, :players_bringing => 1)
			game.gamed_players << GamedPlayer.new(:game_id =>1, :players_bringing => 3)
			expect(game.game_full?).to eq(true)
			end
	end

	describe 'revised_players_looking_for' do
		it 'should return an updated version of players_looking_for for an individual game' do
			game = Game.new(:id => 1, :title => "Game 2", :players_looking_for => 4)
			game.gamed_players << GamedPlayer.new(:game_id =>1, :players_bringing => 1)
			expect(game.revised_players_looking_for).to eq(3)
		end
	end


end