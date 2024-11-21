class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
    @user = current_user
    @soozies = current_user.soozies
    @bookings = Booking.where(user: current_user)
  end

  def edit
  end

  def update
    @user.update(user_params)

    if @user.save
      redirect_to user_path(@user), notice: "User updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email, :first_name, :last_name, :description)
  end
end
