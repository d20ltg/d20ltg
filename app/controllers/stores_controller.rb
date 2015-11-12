class StoresController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :requires_admin, :only => [:new, :edit, :create, :update]

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
    @store = Store.create(store_params)
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

    def store_params
      params.require(:store).permit!
    end
end
