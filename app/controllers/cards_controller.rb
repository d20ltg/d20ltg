class CardsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :requires_admin, :only => [:new, :edit, :create, :update]

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
    elsif params[:expac_id]
      @expansion = Expansion.find(params[:expac_id])
      @cards = Card.where("expansion_id = ?", @expansion.id)
    else
      @expansion = Expansion.find(params[:expansion])
      logger.info("--------------------- #{@expansion.inspect} ---------------------")
      @cards = Card.where("expansion_id = ?", @expansion.id)
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
  end

  def create
    @card = Card.create(card_params)
    expac_id = @card.expansion_id
    redirect_to "/cards?expac_id=#{expac_id}"
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      redirect_to "/cards?expac_id=#{expac_id}"
    end
  end

  private

  def card_params
    params.require(:card).permit!
  end
end
