class GamesController < ApplicationController
	# before_action :authenticate_user!
	respond_to :xml, :json, :html

	def show
		@games = Game.all
		@sports = Sport.all
		@game = Game.find_by(:id => params[:id])
		@gamed_players = Game.find_by(:id => params[:id]).gamed_players
		@gamed_player = GamedPlayer.new
		@gamed_player_current = GamedPlayer.find_by(:user_id => current_user.id, :game_id => @game.id)
	
	end

	def index
		@sports = Sport.all
		@games = Game.all
		@parks = Park.joins(:sports).where("sports.name = ?", params[:sport]) if params[:sport]
		var = params[:sport]
	end

	def create
		@games = Game.all
		@sports = Sport.all
	  @game = current_user.games.create(game_params)
	  	redirect_to @game
	end

	def new
		@games = Game.all
		@court_id = params[:court_id]
	  @game = Game.new
	  	if @game.save
	  		redirect_to @game
	  	end
	  @sports = Sport.all
	  @park_id = Park.find_by(:park_number => params[:court_id])
	end

	def edit
		@games = Game.all
		@game = Game.find_by(:id => params[:id])
		@sports = Sport.all
	end

	def update
		@games = Game.all
		@game = Game.find_by(:id => params[:id])
		@game.update(game_params)
		flash[:info] = "Game Successfully Modified."
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

	
	def home
		@games = Game.all
		@sports = Sport.all
	end

	private

	def game_params
		return params.require(:game).permit(:title, :players_committed, :players_looking_for, :court_id, :skill_level, :start_time, :end_time)
	end

end
