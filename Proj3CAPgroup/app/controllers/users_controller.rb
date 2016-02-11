class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
     # string = '/users/' + user.id.to_s +'/show'
     redirect_to  '/'
    else
      redirect_to '/'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def edit
  end
end









