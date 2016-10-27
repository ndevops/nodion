class Admin::ImagesController < Admin::ApplicationController
  def index
    @images = Image.all
  end
end
