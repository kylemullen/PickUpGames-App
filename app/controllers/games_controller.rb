class GamesController < ApplicationController
	
	def show

	end

	def index
		@games = Game.all
		@games = @games.where("status == ?" , "open") 
	end

	def create
	  @game = current_user.games.create(game_params)
	  ## ^^^^^long syntax for this.  Don't have to use the "merge"
	  #@game = Game.create(game_params.merge({:user_id => current_user.id}))
	end

	def new
	  @game = Game.new
	end

	private

	def game_params
		return params.require(:game).permit(:title, :players_committed, :players_looking_for)
	end

end
