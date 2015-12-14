class AnnouncementsController < ApplicationController
  before_filter :login_required
  before_filter :requires_admin

  def index
    @announcements = Announcement.all
  end

  def open
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)

    if @announcement.save
      flash[:success] = "Successfully added a new Announcement!"
      redirect_to announcements_path, notice: "The announcement #{@announcement.title} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.remove_image!
    @announcement.save
    @announcement.destroy
    redirect_to announcements_path, notice: "The announcement #{@announcement.title} has been deleted."
  end

  def edit
  end

  def splash_slider
    @announcements = Announcement.all
  end

  private
  def announcement_params
    params.require(:announcement).permit!
  end
end
