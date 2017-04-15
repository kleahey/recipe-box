class ProfilesController < ApplicationController
  def show
    @user = User.find_by(user_name: params[:user_name])
    @recipes = User.find_by(user_name: params[:user_name]).recipes.order('created_at DESC')
  end
end
