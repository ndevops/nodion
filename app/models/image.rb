class Image < ActiveRecord::Base
  has_many :nodes
  belongs_to :distribution
end
