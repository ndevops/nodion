class Hypervisor < ActiveRecord::Base
  belongs_to :region
  has_many :nodes

  attr_accessor :password

  validate :is_reachable?

  def is_reachable?
    connection = ::NodeAction.new(self.hostname, "root", {:password => "#{self.password}"}).test_connection
    if connection == false
      errors.add("HV:", "Not reachable")
    end
  end
end
