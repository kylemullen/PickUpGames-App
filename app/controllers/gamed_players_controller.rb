class GamedPlayersController < ApplicationController
	
	def new
	end

	def create
		
	end

	def show
	end

	def index
	end

	def destroy
	end

	def edit
	end

	private
	def game_params
		return params.require(:gamed_player).permit(:user_id, :game_id, :players_bringing)
	end

end
