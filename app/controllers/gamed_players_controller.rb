class GamedPlayersController < ApplicationController
	
	def new
	end

	def create
		# if Order.find_by(:user_id => current_user.id, :status => "cart")
		# 	@order = Order.find_by(:user_id => current_user.id, :status => "cart")
		# else
		# 	@order = Order.create(:status => "cart", :user_id => current_user.id)
		# end

		GamedPlayer.create(gamed_player_params)
		flash[:success] = "You Signed Up!"
		redirect_to "/"
	end

	def show
	end

	def index
	end

	def destroy
	end

	def edit
	end

	private
	def gamed_player_params
		return params.require(:gamed_player).permit(:user_id, :game_id, :players_bringing)
	end

end
