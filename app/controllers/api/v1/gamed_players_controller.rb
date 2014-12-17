class Api::V1::GamedPlayersController < ApplicationController
respond_to :xml, :json, :html 

	def index
	  @gamed_players = GamedPlayer.all
	end

	def show
		@gamed_player = GamedPlayer.find_by(:id => params[:id])
	end

	def create
 	  @gamed_player = GamedPlayer.new(gamed_player_params)
	  if @gamed_player.save
	  	redirect_to '/'
	  else
      render json: { errors: @gamed_player.errors.full_messages }, status: 422
    end

	end

	def destroy
	  @gamed_player = GamedPlayer.find_by(:id => params[:id])
	  @gamed_player.destroy
	end

	def update
	  @gamed_player = GamedPlayer.find_by(:id => params[:id])
	  @gamed_player.update(gamed_player_params)
	end

	private 

	def gamed_player_params
		return params.require(:gamed_player).permit(:user_id, :game_id, :players_bringing)
	end

	def restrict_access
    authenticate_or_request_with_http_token do |api_key, options|
      User.find_by(:email => request.headers["X-User-Email"], :api_key => api_key)
    end
  end


end