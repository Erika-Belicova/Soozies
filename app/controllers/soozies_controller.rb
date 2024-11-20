class SooziesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_soozie, only: [:show, :edit, :update]

  def index
    @soozies = Soozie.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @soozie = Soozie.new
  end

  def create
    @soozie = Soozie.new(soozie_params)
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
      :first_name, :last_name, :description, :gender, :city, :available,
      :price, :age, :hair_color, :eye_color, :height, :weight, :user
    )
  end
end
