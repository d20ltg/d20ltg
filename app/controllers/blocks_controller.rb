class BlocksController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :requires_admin, :only => [:new, :edit, :create]

  def index
    @blocks = Block.all
  end

  def new
    @block = Block.new
  end

  def edit
    @block = Block.find(params[:id])
  end

  def create
    @block = Block.create(block_params)
    redirect_to expansions_path 
  end

  private

    def block_params
      params.require(:block).permit!
    end
end
