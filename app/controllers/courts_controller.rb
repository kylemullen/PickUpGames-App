class CourtsController < ApplicationController
	before_action :authenticate_admin!, :only => [:edit, :destroy, :new, :update, :create]

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

	



end
