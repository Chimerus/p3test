class SessionsController < ApplicationController
	def new
	end

	def create
		#find the usere by there email
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
		  session[:user_id] = user.id
		  redirect_to  '/users/' + user.id +'/show'
		else
			redirect_to '/'
		end
	end
	def destory 
		session[:user_id] = nil
		redirect_to '/login'

	end
end
