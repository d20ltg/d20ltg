class GamesController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :requires_admin, :only => [:new, :edit, :create, :update]

  def index
    logger.info("master params <><><><><><><><> #{params[:ttg_id]}")

    if params[:filter]
      @games = Game.by_letter(params[:filter][:game])
      @searched = Array.new
      if @games.length == 1
        @searched << @games[0]
      else
        @games.each do |game|
          @searched << game
        end
      end
      logger.info("----------------- wat #{@searched.inspect} and AR relation: #{@games} params #{params[:filter][:game]}——————————")
      render :search
    elsif params[:ttg_id]
      @tabletop_game = TabletopGame.find(params[:ttg_id])
      @games = Game.where("tabletop_game_id = ?", @tabletop_game.id)
    else
      @tabletop_game = TabletopGame.find(params[:tabletop_game])
      logger.info("--------------------- #{@tabletop_game.inspect} ---------------------")
      @games = Game.where("tabletop_game_id = ?", @tabletop_game.id)
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.create(game_params)
    ttg_id = @game.tabletop_game_id
    flash[:success] = "Successfully added a new Game!"
    redirect_to "/games?ttg_id=#{ttg_id}"
  end

  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(game_params)
      flash[:success] = "Successfully updated the Game!"
      ttg_id = @game.tabletop_game_id
      redirect_to "/games?ttg_id=#{ttg_id}"
    end
  end

  def destroy
    @game = Game.find(params[:id])
    ttg_id = @game.tabletop_game_id
    @game.destroy
    flash[:success] = "Successfully removed Game."
    redirect_to "/games?ttg_id=#{ttg_id}"
  end

  private

  def game_params
    params.require(:game).permit!
  end
end
