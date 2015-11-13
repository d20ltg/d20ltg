class PageContentsController < ApplicationController
  def home
    @content = PageContent.find_by_name('home')
    render :template => 'page_contents/content'
  end
end
