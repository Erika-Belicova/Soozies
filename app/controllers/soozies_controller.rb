class SooziesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @soozies = Soozie.all
  end
end
