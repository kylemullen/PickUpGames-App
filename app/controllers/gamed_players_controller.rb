class GamedPlayersController < ApplicationController
	
	def new
	end

	def create
		GamedPlayer.create(gamed_player_params)
	
		flash[:success] = "You Signed Up!"
		redirect_to "/games/#{gamed_player_params[:game_id]}"
	end

	def show
	end

	def index
	end

	def destroy
		@gamed_player = GamedPlayer.find_by(:id => params[:id])
		@gamed_player.destroy
		flash[:danger] = "You're No Longer Signed Up"
		redirect_to "/games"
	end

	def edit
		@gamed_player = GamedPlayer.find_by(:id => params[:id])
	end

	private
	def gamed_player_params
		return params.require(:gamed_player).permit(:user_id, :game_id, :players_bringing)
	end

end
