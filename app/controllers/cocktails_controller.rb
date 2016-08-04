class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show, :edit, :destroy]
  before_action :new_cocktail, only: [:index]

  def index
    @cocktails = Cocktail.all
  end
  def show
    @dose = Dose.new
  end

  def create

    @cocktail = Cocktail.create(cocktail_params)
    if @cocktail.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def new_cocktail
    @cocktail = Cocktail.new
  end
end
