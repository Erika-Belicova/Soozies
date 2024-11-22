class OffersController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @soozies = Soozie.where(user: current_user)
  end
end
