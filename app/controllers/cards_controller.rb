class CardsController < ApplicationController
  
  def index
    @expansion = Expansion.find(params[:expansion])
    @cards = Card.where("expansion_id like ?", @expansion.id)
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
