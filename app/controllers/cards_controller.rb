class CardsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :requires_admin, :only => [:new, :edit, :create, :update]

  def index
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
    redirect_to cards_path
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      redirect_to cards_path
    end
  end

  private

  def card_params
    params.require(:card).permit!
  end
end
