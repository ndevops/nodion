class Admin::RegionsController < Admin::ApplicationController
  def index
    @regions = Region.all
  end
end
