class SooziesController < ApplicationController
  before_action :set_soozie, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!

  def index
    @soozies = Soozie.all
  end

  def show
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
    if @sozie.save
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
    params.require(@soozie).permit(
      :first_name, :last_name, :description, :gender, :city, # migration ! not changed in database yet
      :available, :price, :age, # migration ! not changed in database yet
      :hair_color, :eye_color, :height, :weight, :user
    )
  end
end
