class ProfilesController < ApplicationController

  def show
    @user = User.find_by(user_name: params[:user_name])
  end

  def edit
    @user = User.find_by(user_name: params[:user_name])
  end

  def update
    respond_to do |format|
      @user = User.find_by(user_name: params[:user_name])
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

end
