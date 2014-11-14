class GamesController < ApplicationController
	
	def show

	end

	def index

	end

	def create
	  @game = Game.new(params[:game])
	end

	def new
	  @game = Game.new
	end

end
