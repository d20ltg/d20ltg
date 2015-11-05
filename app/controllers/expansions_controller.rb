class ExpansionsController < ApplicationController

  def new
      @expansion = Expansion.new
  end

  def edit
    @expansion = Expansion.find(params[:id])
  end

  def create
    @expansion = Expansion.new(expansion_params)

    if @expansion.save
      redirect_to expansions_path
    else
      render "new"
    end
  end

  def update
    @expansion = Expansion.find(params[:id])
    if @expansion.update_attributes(expansion_params)
      redirect_to expansions_path
    end
  end

  def show
    @expansion = Expansion.find(params[:id])
  end

  def index
    @expansions = Expansion.all
  end

  private

    def expansion_params
      params.require(:expansion).permit!
    end
end
