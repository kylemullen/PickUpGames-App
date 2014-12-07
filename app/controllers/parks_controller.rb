class ParksController < ApplicationController
	before_action :authenticate_admin!, :only => [:edit, :destroy, :new, :update, :create]

	@sports = Sport.all
	def create
	end

	def new
	end

	def index
		@parks = Park.all
		@sports = Sport.all
	end

	def show
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
