class ParksController < ApplicationController
	before_action :authenticate_admin!, :only => [:edit, :destroy, :new, :update, :create]

	def create
	end

	def new
	end

	def index
		@games = Game.all
		@parks = Park.all
		@sports = Sport.all
		@parks = Park.joins(:sports).where("sports.name = ?", params[:sport]) if params[:sport]
	end

	def show
		@games = Game.all
		@park = Park.find_by(:id => params[:id])
		@sports = Sport.all
	end

	def destroy
	end

	def edit
	end

	def update
	end

end
