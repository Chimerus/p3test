class SessionsController < ApplicationController
	def new
	end

	def create
		#find the usere by there email
		user = User.where(email: params[:email]).first
     binding.pry
		if user && user.authenticate(params[:password])
		  cookies.permanent[:auth_token] = user.auth_token
		 redirect_to '/'
		else
			flash.now.alert = "Invalid email or password"
			redirect_to '/login'
		end
	end
	def destory 
		cookies.delete(:auth_token)
		redirect_to '/login' #:notice => "Logged out!"

	end
end
