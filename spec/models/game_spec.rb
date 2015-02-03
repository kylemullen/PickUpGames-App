require 'rails_helper'

describe Game do
	describe 'email' do
		it 'should return the email of the user that created the game' do
			game = Game.new(:title => "Game 2", :user_id => 1)
			game.user = User.new(:id => 1, :email => "myemail@email.com")
			expect(game.email).to eq("myemail@email.com")
		end
	end
end