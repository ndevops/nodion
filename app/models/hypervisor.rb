class Hypervisor < ActiveRecord::Base
  belongs_to :region
  has_many :nodes
  has_many :tasks, as: :target

  attr_accessor :password

  validate :is_reachable?

  def is_reachable?
    connection = ::HypervisorAction.new(self.hostname, "root", {:password => "#{self.password}"}).test_connection
    if connection == false
      errors.add("HV:", "Not reachable")
    end
  end
end
