class SooziesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_soozie, only: [:show, :edit, :update]

  def index
    @soozies = Soozie.all
    # The `geocoded` scope filters only flats with coordinates
    @soozie = Soozie.geocoded
    @markers = @soozies.geocoded.map do |soozie|
      {
        lat: soozie.latitude,
        lng: soozie.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {soozie: soozie}),
        marker_html: render_to_string(partial: "marker",  locals: {soozie: soozie})
      }
    end

    if params[:query].present?
      @soozies = @soozies.where("city ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @soozie = Soozie.new
    @user = current_user
  end

  def create
    @soozie = Soozie.new(soozie_params)
    @soozie.user = current_user
    if @soozie.save
      redirect_to soozies_path(@soozie), notice: "Soozie created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @soozie.update(soozie_params)
    if @soozie.save
      redirect_to soozies_path(@soozie), notice: "Soozie created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_soozie
    @soozie = Soozie.find(params[:id])
  end

  def soozie_params
    params.require(:soozie).permit(
      :photo, :first_name, :last_name, :description, :gender, :city, :available,
      :price, :age, :hair_color, :eye_color, :height, :weight, :user, :longitude, :latitude
    )
  end
end
