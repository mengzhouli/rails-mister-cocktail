class CocktailsController < ApplicationController
  before_action :set_cocktail, except: [:index, :new, :create]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = @cocktail.doses
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end


  def cocktail_params
    params.require(:cocktail).permit(:name, photos: [])
  end

end
