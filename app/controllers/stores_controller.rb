class StoresController < ApplicationController

  def new
    if Store.all.eql? nil
      @store = Store.new
    else
      redirect_to stores_path
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def create
    @store = Store.create(event_params)
    redirect_to stores_path
  end

  def update
    @store = Store.find(params[:id])
    if @store.update_attributes(store_params)
      redirect_to stores_path
    end
  end

  def show
    @store = Store.find(params[:id])
  end

  def index
    @stores = Store.all
    @store = @stores.first
  end

  private

    def Store_params
      params.require(:store).permit!
    end
end
