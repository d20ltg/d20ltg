class ComicsController < ApplicationController
  
  def index
    logger.info("master params <><><><><><><><> #{params[:expac_id]}")

    if params[:filter]
      @cards = Card.by_letter(params[:filter][:card])
      @searched = Array.new
      if @cards.length == 1
        @searched << @cards[0]
      else
        @cards.each do |card|
          @searched << card
        end
      end
      logger.info("----------------- wat #{@searched.inspect} and AR relation: #{@cards} params #{params[:filter][:card]}---------------------")
      render :search
    elsif params[:universe_id]
      @universe = Universe.find(params[:universe_id])
      @comics = Comic.where("universe_id = ?", @universe.id)
    else
      #@universe = Expansion.find(params[:expansion])
      @universe = Universe.find(params[:universe])
      logger.info("--------------------- #{@universe.inspect} ---------------------")
      @comics = Comic.where("universe_id = ?", @universe.id)
    end
  end


  def show
    @comic = Comic.find(params[:id])
    @universe = Universe.find(@comic.universe_id)
  end

  def new
    @comic = Comic.new
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def create
    @comic = Comic.create(comic_params)
    universe_id = @comic.universe_id
    flash[:success] = "Successfully added a new Comic!"
    redirect_to "/comics?universe_id=#{universe_id}"
  end

  def update
    @comic = Comic.find(comic_params)
    if @comic.update_attributes(comic_params)
      flash[:success] = "Successfully updated the Comic!"
      redirect_to "/comics?universe_id=#{universe_id}"
    end
  end

  def destroy
    @comic = Comic.find(params[:id])
    @universe = Universe.find(@comic.universe_id)
    @comic.destroy
    redirect_to "/comics?universe_id=#{@universe.id}"
  end

  private

  def comic_params
    params.require(:comic).permit!
  end
end
