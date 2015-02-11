class ParksController < ApplicationController
	before_action :authenticate_admin!, :only => [:edit, :destroy, :new, :update, :create]

	before_action :initialize_sports
	before_action :initialize_games

	def create
	end

	def new
	end

	def index
		@games = Game.all
		@parks = Park.all
		@sports = Sport.all
		@parks = Park.joins(:sports).where("sports.name = ?", params[:sport]) if params[:sport]
		if params[:sport]
			@sport_image = params[:sport].downcase + '.png'
		end
	end

	def show
		@games = Game.all.where("end_time >= ?" , Date.current)
		@park = Park.find_by(:id => params[:id])
		@sports = Sport.all
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
