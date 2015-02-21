class UsersController < ApplicationController
  check_authorization

  def update
    @user = User.find(params[:id])
    authorize! :update, @user
    if @user.update_attributes(user_params_for_update)
      respond_to do |format|
        format.json { render json: @user }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params_for_update
    params.require(:user).permit(:system_spec, :has_mac, :has_linux, :has_windows, :first_name, :last_name)
  end
end
