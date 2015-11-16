class BlocksController < ApplicationController
  before_filter :login_required 

  def new
    @block = Block.new
  end

  def edit
    @block = Block.find(params[:id])
  end

  def create
    @block = Block.new(block_params)
    redirect_to expansions_path 
  end

  private

    def block_params
      params.require(:block).permit!
    end
end
