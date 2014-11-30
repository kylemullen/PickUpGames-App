class ParksController < ApplicationController
	# before_action :authenticate_admin!, :only => [:edit, :destroy, :new, :update, :create]


	def create
	end

	def new
	end

	def index
		@parks = Park.all
	end

	def show
		@park = Park.find_by(:id => params[:id])
	end

	def destroy
	end

	def edit
	end

	def update
	end

end
