class Admin::HypervisorsController < Admin::ApplicationController
  def index
    @hypervisors = Hypervisor.all
  end

  def show
    @hypervisor = Hypervisor.find(params[:id])
  end

  def new
    @hypervisor = Hypervisor.new
  end

  def edit
    @hypervisor = Hypervisor.find(params[:id])
  end

  def create
    @hypervisor = Hypervisor.new(hypervisor_params)

    if @hypervisor.save
      redirect_to admin_hypervisors_path
    else
      render 'new'
    end
  end

  def update
    @hypervisor = Hypervisor.find(params[:id])

    if @hypervisor.update(hypervisor_params)
      redirect_to @hypervisor
    else
      render 'edit'
    end
  end

  def destroy
    @hypervisor = Hypervisor.find(params[:id])
    @hypervisor.destroy

    redirect_to admin_hypervisors_path
  end

  private

  def hypervisor_params
    params.require(:hypervisor).permit(:hostname, :port, :region_id, :password)
  end
end
