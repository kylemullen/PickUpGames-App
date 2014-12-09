class GamedPlayersController < ApplicationController
	
	def new
	end

	def create
		if Game.find_by(:user_id => current_user.id, :status => "open")
			

		elsif 


	end

	def show
	end

	def index
	end

	def destroy
	end

	def edit
	end

end
