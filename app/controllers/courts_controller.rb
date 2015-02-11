class CourtsController < ApplicationController
	before_action :authenticate_admin!, :only => [:edit, :destroy, :new, :update, :create]

	before_action :initialize_sports
	before_action :initialize_games

	def create
	end

	def new
	end

	def index
		@sports = Sport.all
		@parks = Park.all
		@games = Game.all
		@parks = Park.joins(:sports).where("sports.name = ?", params[:sport]) if params[:sport]
	end

	def show
		
	end

	def destroy
	end

	def edit
	end

	def update
	end

	private 

	def initialize_games
		@games = Game.all
	end

	def initialize_sports
		@sports = Sport.all
	end



end
