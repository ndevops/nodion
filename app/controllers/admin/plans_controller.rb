class Admin::PlansController < Admin::ApplicationController
  def index
    @plans = Plan.all
  end
end
