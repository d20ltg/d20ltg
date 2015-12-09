class UniversesController < ApplicationController
  def index
    @universes = Universe.all
  end

  def show
    @universe = Universe.find(params[:id])
  end

  def new
    @universe = Universe.new
  end

  def edit
    @universe = Universe.find(params[:id])
  end

  def create
    @universe = Universe.new(universe_params)

    if @universe.save!
      redirect_to universes_path
    else
      render 'new'
    end
  end

  def update
    @universe = Universe.find(params[:id])
    if @universe.update_attributes(universe_params)
      redirect_to universes_path
    else
      render 'edit'
    end
  end

  private

  def universe_params
    params.require(:universe).permit!
  end
end
