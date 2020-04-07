class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show]
  before_action :set_cocktail, only: %i[show destroy]

  def home
  end

  def index
    # @cocktails = Cocktail.all
    @cocktails = policy_scope(Cocktail)
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    authorize @cocktail
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user
    authorize @cocktail
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    authorize @cocktail
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
    authorize @cocktail
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
