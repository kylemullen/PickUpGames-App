class SportsController < ApplicationController
	before_action :authenticate_admin!, :only => [:edit, :destroy, :new, :update, :create]

	before_action :initialize_games

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
		
	end

	private

	def initialize_games
		@games = Game.all
	end

end
