class SessionsController < ApplicationController
	def new
	end

	def create
		#find the user by their email
		user = User.where(email: params[:email]).first
		if user && user.authenticate(params[:password])
		  session[:user_id] = user.id
		 redirect_to '/'
		else
			redirect_to '/login'
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to '/login'

	end
end
