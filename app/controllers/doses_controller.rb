class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end

  def destroy
    @dose.delete
    redirect_to dose_path
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
