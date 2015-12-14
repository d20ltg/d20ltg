class AdminController < ApplicationController
  before_filter :requires_admin, :only => [:index]

  def index
    @store = Store.all.first
  end
end
