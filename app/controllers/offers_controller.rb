class OffersController < ApplicationController
  def index
    # @offers = current_user.soozies
    # @user = current_user
    @bookings = Booking.where(user: current_user)
  end
end
