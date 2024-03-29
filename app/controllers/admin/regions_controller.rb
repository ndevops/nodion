class Admin::RegionsController < Admin::ApplicationController
  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)

    if @region.save
      redirect_to admin_regions_path
    else
      render 'new'
    end
  end

  def destroy
    @region = region.find(params[:id])
    @region.destroy

    redirect_to admin_regions_path
  end

  private

  def region_params
    params.require(:region).permit(:name,)
  end
end
