class GamesController < ApplicationController
	before_action :authenticate_user!, :only => [:edit, :destroy, :new, :update, :create, :show]
	before_action :initialize_sports
	before_action :initialize_games
	respond_to :json, :html

	def show
		@game = Game.find_by(:id => params[:id])
		@gamed_players = Game.find_by(:id => params[:id]).gamed_players
		@gamed_player = GamedPlayer.new
		@gamed_player_current = GamedPlayer.find_by(:user_id => current_user.id, :game_id => @game.id)

		#made to check to see if current user signed up for the game and give you the option to remove yourself from the game
		if @game.gamed_players.map(&:user_id).include?(current_user.id)
			@user_signed_up = true
		else
			@user_signed_up = false
		end

		#made for the view to provide butons for modifying/deleting the game if the current_user created the game
		if @game.user_id == current_user.id
			@your_game = true
		else
			@your_game = false
		end
	end

	def index
		#making sure that the index page is only showing games that are from today
		@games = Game.all.where("end_time >= ?" , Date.current)
		@parks = Park.joins(:sports).where("sports.name = ?", params[:sport]) if params[:sport]
		var = params[:sport]
	end

	def create
	  @game = current_user.games.create(game_params)
	  	redirect_to @game
	end

	def new
		@court_id = params[:court_id]
	  @game = Game.new
	  @park_id = Park.find_by(:park_number => params[:court_id])
	end

	def edit
		@game = Game.find_by(:id => params[:id])
	end

	def update
		@game = Game.find_by(:id => params[:id])
		@game.update(game_params)
		flash[:info] = "Game Successfully Modified."
		redirect_to @game
	end

	def destroy
		@game = Game.find_by(:id => params[:id])
		@game.destroy
		flash[:danger] = "Game Removed."
		redirect_to '/games'
	end

	
	def home
	end

	private

	def initialize_games
		@games = Game.all
	end

	def initialize_sports
		@sports = Sport.all
	end

	def game_params
		return params.require(:game).permit(:title, :players_committed, :players_looking_for, :court_id, :skill_level, :start_time, :end_time)
	end

end
