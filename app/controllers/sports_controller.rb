class SportsController < ApplicationController
	before_action :authenticate_admin!, :only => [:edit, :destroy, :new, :update, :create]

	def create
	end

	def new
	end

	def index
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
