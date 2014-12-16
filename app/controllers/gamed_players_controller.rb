class GamedPlayersController < ApplicationController
	
	def new
	end

	def create
		GamedPlayer.create(gamed_player_params)
		flash[:success] = "You Signed Up!"
		redirect_to "/"
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
	def gamed_player_params
		return params.require(:gamed_player).permit(:user_id, :game_id, :players_bringing)
	end

end
