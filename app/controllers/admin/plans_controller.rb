class Admin::PlansController < Admin::ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      redirect_to admin_plans_path
    else
      render 'new'
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    redirect_to admin_plans_path
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :ram_value, :cpu_value, :storage_value, :storage_type)
  end
end
