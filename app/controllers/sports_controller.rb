class SportsController < ApplicationController
	before_action :authenticate_admin!, :only => [:edit, :destroy, :new, :update, :create]

	before_action :initialize_games

	def create
	end

	def new
	end

	def index
		@sport = Sport.find_by(:params[:id])
		@sports = Sport.all
		@parks = Park.all
		@parks = Park.joins(:sports).where("sports.name = ?", params[:sport]) if params[:sport]
	end

	def show
		@sports = Sport.all
		@parks = Park.all
		@parks = Park.joins(:sports).where("sports.name = ?", params[:sport]) if params[:sport]
		# @sport_id = params[:id]
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

end
