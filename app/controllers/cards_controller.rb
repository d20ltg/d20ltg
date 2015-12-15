class CardsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :requires_admin, :only => [:new, :edit, :create, :update]

  def index
    @order_item = current_order.order_items.new

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
      render :search
    elsif params[:expac_id]
      @expansion = Expansion.find(params[:expac_id])
      @cards = Card.where("expansion_id = ?", @expansion.id)
    else
      @expansion = Expansion.find(params[:expansion])
      @cards = Card.where("expansion_id = ?", @expansion.id)
    end
  end

  def show
    @card = Card.find(params[:id])
    set = Expansion.find(@card.expansion_id).set_abbreviation
    @card_data = MagicApiService.get_cards({ :set => set, :name => @card.name }).first
    @image_url = MagicApiService.get_image_url_for_card(@card)
    @card_text = card_text_to_html(@card_data['text'])
    @order_item = current_order.order_items.new
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
    flash[:success] = "Successfully added a new Card!"
    redirect_to "/cards?expac_id=#{expac_id}"
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      expac_id = @card.expansion_id
      redirect_to "/cards?expac_id=#{expac_id}"
    end
  end

  def destroy
    @card = Card.find(params[:id])
    expac_id = @card.expansion_id
    @card.destroy
    flash[:success] = "Successfully removed Card."
    redirect_to "/cards?expac_id=#{expac_id}"
  end

  private

  def card_params
    params.require(:card).permit!
  end

  def card_text_to_html(text)
    text.gsub(/\n/, '<br>')
        .gsub(/{([0-9WUBRGS])}/, get_symbol_tag('\1'))
  end

  def get_symbol_tag(name, size = 'small')
    "<span class=\"symbol\"><img src=\"http://gatherer.wizards.com/Handlers/Image.ashx?size=#{size}&name=#{name}&type=symbol\" alt=\"{#{name}}\"></span>"
  end
end
