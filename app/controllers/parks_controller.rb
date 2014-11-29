class ParksController < ApplicationController
	# before_action :authenticate_admin!, :only => [:edit, :destroy, :new, :update, :create]


	def create
	  @game = current_user.games.create(game_params)
	  ## ^^^^^long syntax for this.  Don't have to use the "merge"
	  #@game = Game.create(game_params.merge({:user_id => current_user.id}))
	  redirect_to '/'
	end

	def new
		@game = Game.new
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
