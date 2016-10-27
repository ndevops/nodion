class Region < ActiveRecord::Base
  has_many :nodes
  has_many :hypervisors
end
