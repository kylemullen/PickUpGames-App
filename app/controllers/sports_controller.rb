class SportsController < ApplicationController
	before_action :authenticate_admin!, :only => [:edit, :destroy, :new, :update, :create]

	def create
	end

	def new
	end

	def index
		@parks = Park.joins(:sports).where("sports.name = ?", params[:sport]) if params[:sport]
	end

	def show
		@parks = Park.joins(:sports).where("sports.name = ?", params[:sport]) if params[:sport]
		# @sport_id = params[:id]
	end

	def destroy
	end

	def edit
	end

	def update
	end

end
