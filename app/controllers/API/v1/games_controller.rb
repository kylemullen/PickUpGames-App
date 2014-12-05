class Api::V1::GamesController < ApplicationController

	respond_to :xml, :json, :html

	def index
	  @games = Game.all
	end

	def show
		@game = Game.find_by(:id => params[:id])
	end

	def create
 	  @game = game.new(game_params)
	  if @game.save
	  else
      render json: { errors: @game.errors.full_messages }, status: 422
    end
	end

	def destroy
	  @game = game.find_by(:id => params[:id])
	  @game.destroy
	end

	def update
	  @game = game.find_by(:id => params[:id])
	  @game.update(game_params)
	end

	private 

	def game_params
		return params.require(:game).permit(:title, :court_id, :players_committed, :players_looking_for, :status)
	end
end