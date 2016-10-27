class Admin::DistributionsController < Admin::ApplicationController
  def index
    @distributions = Distribution.all
  end
end
