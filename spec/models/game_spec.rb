require 'rails_helper'

describe Game do
	describe 'email' do
		it 'should return the email of the user that created the game' do
			user = User.new(:id => 1, :email => "myemail@email.com")
			game = Game.new(:title => "Game 2", :user_id => 1)
			expect(game.title).to eq("myemail@email.com")
		end
	end
end