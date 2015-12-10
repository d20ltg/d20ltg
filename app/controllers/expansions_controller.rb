class ExpansionsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :requires_admin, :only => [:new, :edit, :create, :update]

  def new
      @expansion = Expansion.new
      @sets = MagicApiService.get_sets
  end

  def edit
    @expansion = Expansion.find(params[:id])
  end

  def create
    @expansion = Expansion.new(expansion_params)

    if @expansion.save!
      set_abbr = @expansion.set_abbreviation
      begin
        page = 0
        cards = MagicApiService.get_cards({ :set => set_abbr, :page => page })

        while cards.size > 0 do

          cards.each do |card|
            begin
              MagicApiService.create_card_from_hash(@expansion, card)
            rescue
            end
          end

          page += 1
          cards = MagicApiService.get_cards({ :set => set_abbr, :page => page })
        end

        flash[:success] = "Successfully added a new Expansion!"
      rescue
        flash[:danger] = "There was an error importing the set data."
      end

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
    @blocks = Block.all
  end

  private

    def expansion_params
      params.require(:expansion).permit!
    end
end
