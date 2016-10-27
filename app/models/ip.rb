class Ip < ActiveRecord::Base
  has_many :node_ips, class_name: 'Node::Ip'
  has_many :nodes, through: :node_ips
end
