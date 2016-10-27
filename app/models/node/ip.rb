class Node::Ip < ActiveRecord::Base
  belongs_to :node
  belongs_to :ip
end
