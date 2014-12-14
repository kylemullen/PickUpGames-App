class GamesController < ApplicationController
	# before_action :authenticate_user!
	respond_to :xml, :json, :html

	def show
		@parks = Park.all
		@sports = Sport.all
		if params[:id] == "mygame"
			@game = Game.find_by(:user_id => current_user.id, :status => "open")
		else
			@game = Game.find_by(:id => params[:id])
		end
		@parks = Park.joins(:sports).where("sports.name = ?", params[:sport]) if params[:sport]
	end

	def index
		@sports = Sport.all
		@parks = Park.all
		@games = Game.all
		@parks = Park.joins(:sports).where("sports.name = ?", params[:sport]) if params[:sport]
	end

	def create
		@sports = Sport.all
	  @game = current_user.games.create(game_params)
	  redirect_to @game
	  
	end

	def new
		@court_id = params[:court_id]
	  @game = Game.new
	  	if @game.save
	  		redirect_to @game
	  	end
	  @sports = Sport.all
	end

	def edit
		@game = Game.find_by(:id => params[:id])
		@sports = Sport.all
	end

	def update
		@game = Game.find_by(:id => params[:id])
		@game.update(params[:game])
		flash[:info] = "Game Succesfully Modified."
		redirect_to @game
		@sports = Sport.all
	end

	def destroy
		@game = Game.find_by(:id => params[:id])
		@game.destroy
		flash[:danger] = "Game Removed."
		redirect_to '/games'
		@sports = Sport.all

	end

	def map
	end

	def home
		@sports = Sport.all
	end

	private

	def game_params
		return params.require(:game).permit(:title, :players_committed, :players_looking_for, :court_id, :skill_level)
	end

end
