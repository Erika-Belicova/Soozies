class OffersController < ApplicationController
  def index
    @offers = current_user.offers
    @user = current_user
  end
end
