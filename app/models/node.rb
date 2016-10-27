class Node < ActiveRecord::Base
  belongs_to :image
  belongs_to :plan
  belongs_to :region
  belongs_to :user
  has_many :node_ips, class_name: 'Node::Ip'
  has_many :ips, through: :node_ips
  has_many :tasks, as: :target
end
