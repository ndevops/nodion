class Hypervisor < ActiveRecord::Base
  belongs_to :region
  has_many :nodes

  attr_accessor :password
end
