class ProfilesController < ApplicationController
   before_action :authenticate_user!
   before_action :set_user
   before_action :owned_profile, only: [:edit, :update]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
        if @user.update(profile_params)
          format.html { redirect_to profile_path(@user.user_name), notice: "Your profile was updated successfully!" }
        else
          @user.errors.full_messages
          flash[:error] = @user.errors.full_messages
          render :edit
        end
      end
  end


  private

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end

  def owned_profile
    unless current_user == @user
      flash[:alert] = "That profile doesn't belong to you!"
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find_by(user_name: params[:user_name])
  end

end
