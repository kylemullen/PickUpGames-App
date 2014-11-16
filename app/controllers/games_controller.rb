class GamesController < ApplicationController
	
	def show

	end

	def index

	end

	def create
	  @game = current_user.games.create(game_params)
	  # @game = Game.create(game_params.merge({:user_id => current_user.id}))
	end

	def new
	  @game = Game.new
	end

	private

	def game_params
		return params.require(:game).permit(:title)
	end

end
