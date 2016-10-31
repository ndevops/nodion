class NodeCreateWorker
  include Sidekiq::Worker
  def perform(node_id)
    @node = Node.find(node_id)

    
  end
end
