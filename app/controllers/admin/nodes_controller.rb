class Admin::NodesController < Admin::ApplicationController
  def index
    @nodes = Node.all
  end

  def show
    @node = Node.find(params[:id])
  end

  def new
    @node = Node.new
  end

  def create
    @node = Node.new(node_params)

    if @node.save
      redirect_to admin_nodes_path
    else
      render 'new'
    end
  end

  private

  def node_params
    params.require(:node).permit(:hostname, :image_id, :plan_id, :region_id)
  end
end
