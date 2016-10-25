class NodesController < ApplicationController
  def index
    @nodes = current_user.nodes.all
  end

  def show
    @node = Node.find(params[:id])
  end

  def new
    @node = Node.new
  end

  def edit
    @node = Node.find(params[:id])
  end

  def create
    @node = current_user.nodes.new(node_params)

    if @node.save
      redirect_to nodes_path
    else
      render 'new'
    end
  end

  def update
    @node = Node.find(params[:id])

    if @node.update(node_params)
      redirect_to @node
    else
      render 'edit'
    end
  end

  def destroy
    @node = Node.find(params[:id])
    @node.destroy

    redirect_to nodes_path
  end

  private

  def node_params
    params.require(:node).permit(:hostname, :image_id, :plan_id, :region_id)
  end
end
