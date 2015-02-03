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
end