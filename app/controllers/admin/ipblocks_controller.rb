class Admin::IpblocksController < Admin::ApplicationController
  def index
    @ipblocks = Ip.all
  end

  def new
    @ipblock = Ip.new
  end

  def create
    @ipblock = Ip.new(ip_params)

    if @ipblock.save
      redirect_to admin_ipblocks_path
    else
      render 'new'
    end
  end

  private

  def ip_params
    params.require(:ip).permit(:version, :value, :public)
  end
end
