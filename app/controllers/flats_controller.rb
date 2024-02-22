class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    if params[:number_of_guests]
      @flats = Flat.where(number_of_guests: params[:number_of_guests])
    else
      @flats = Flat.all
    end
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flats_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  def number_of_guests

    @flats = Flat.where(number_of_guests: )
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end
end
