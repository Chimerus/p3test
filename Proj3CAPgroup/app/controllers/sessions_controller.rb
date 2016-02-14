class SessionsController < ApplicationController
	def new
	end

	def create
		#find the user by their email
		user = User.where(email: params[:email]).first
		if user && user.authenticate(params[:password])
		  cookies.permanent[:auth_token] = user.auth_token
		 redirect_to '/eta'
		else
<<<<<<< HEAD
			
=======
>>>>>>> a1d3ac917665a4f58bfb1d4da2a4b31d4b7a9c12
			flash[:notice] = "Invalid email or password"
			redirect_to '/'
		end
	end

	def destroy 
		cookies.delete(:auth_token)
		flash[:notice] = "Successfully logged out!"
		redirect_to '/' #:notice => "Logged out!"

	end
end
