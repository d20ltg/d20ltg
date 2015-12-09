class TabletopGamesController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :requires_admin, :only => [:new, :edit, :create, :update]

  def new
    @tabletop_game = TabletopGame.new
  end

  def edit
    @tabletop_game = TabletopGame.find(params[:id])
  end

  def create
    @tabletop_game = TabletopGame.new(tabletop_params)

    if @tabletop_game.save!
      flash[:success] = "Sucessfully added a new Tabletop Game!"
      redirect_to tabletop_games_path
    else
      render "new"
    end
  end

  def update
    @tabletop_game = TabletopGame.find(params[:id])
    if @tabletop_game.update_attributes(tabletop_params)
      flash[:success] = "Successfully updated the Tabletop Game!"
      redirect_to tabletop_games_path
    end
  end

  def show
    @tabletop_game = TabletopGame.find(params[:id])
  end

  def index
    @tabletop_games = TabletopGame.all
  end

  private

    def tabletop_params
      params.require(:tabletop_game).permit!
    end
end
