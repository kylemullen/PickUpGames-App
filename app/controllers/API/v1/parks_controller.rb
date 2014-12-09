class Api::V1::ParksController < ApplicationController
respond_to :xml, :json, :html

	def index
	  @parks = Park.all
	end

	def show
		@park = Park.find_by(:id => params[:id])
	end

	private 

	def restrict_access
    authenticate_or_request_with_http_token do |api_key, options|
      User.find_by(:email => request.headers["X-User-Email"], :api_key => api_key)
    end
  end


end