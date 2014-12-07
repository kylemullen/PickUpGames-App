class GamesController < ApplicationController
	# before_action :authenticate_user!
	respond_to :xml, :json, :html

	@link = "http://localhost:3000/"

	def show
		@parks = Park.all

		if params[:id] == "mygame"
			@game = Game.find_by(:user_id => current_user.id, :status => "open")
		else
			@game = Game.find_by(:id => params[:id])
		end
	end

	def index
		@parks = Park.all
		@games = Game.all
	end

	def create
	  @game = current_user.games.create(game_params)
	  ## ^^^^^long syntax for this.  Don't have to use the "merge"
	  #@game = Game.create(game_params.merge({:user_id => current_user.id}))
	  redirect_to @game
	end

	def new
		@court_id = params[:court_id]
	  @game = Game.new
	end

	def edit
		@game = Game.find_by(:id => params[:id])
	end

	def update
		@game = Game.find_by(:id => params[:id])
		@game.update(params[:game])
		flash[:info] = "Game Succesfully Modified."
		redirect_to @game
	end

	def destroy
		@game = Game.find_by(:id => params[:id])
		@game.destroy
		flash[:danger] = "Game Removed."
		redirect_to '/games'

	end

	def map
	end

	private

	def game_params
		return params.require(:game).permit(:title, :players_committed, :players_looking_for, :court_id, :skill_level)
	end

end
