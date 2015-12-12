class UniversesController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :requires_admin, :only => [:new, :edit, :create, :update]

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
      flash[:success] = "Successfully added a new Universe!"
      redirect_to universes_path
    else
      render 'new'
    end
  end

  def update
    @universe = Universe.find(params[:id])
    if @universe.update_attributes(universe_params)
      flash[:success] = "Successfully updated the Universe!"
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
