class Node < ActiveRecord::Base
  belongs_to :image
  belongs_to :plan
  belongs_to :region
  belongs_to :user
  has_many :node_ips, class_name: 'Node::Ip'
  has_many :ips, through: :node_ips
  has_many :tasks, as: :target

  validates :hostname, presence: true
  validates :image_id, presence: true
  validates :plan_id, presence: true
  validates :region_id, presence: true
  validate :if_there_is_a_free_ip

  before_create :create_uuid

  def if_there_is_a_free_ip
    errors.add("IP:", "There is no available IP.") unless ::Ip.where(used: false).any?
  end

  def create_uuid
    self.uuid = SecureRandom.uuid
  end
end
