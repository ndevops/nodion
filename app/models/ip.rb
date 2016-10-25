class Ip < ActiveRecord::Base
  has_many :node_ips
  has_many :nodes, through: :node_ips
end
