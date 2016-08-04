class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :update, :destroy]
  before_action :find_cocktails, only: [:new, :create]

  def create
    @dose = @cocktail.doses.create(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @dose = @cocktail.doses.build
  end

  def update
    @dose.update(dose_params)
  end

  def destroy
    @dose.destroy
    redirect_to @dose.cocktail
  end

  private
  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id )
  end

  def find_cocktails
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end

