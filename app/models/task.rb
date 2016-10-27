class Task < ActiveRecord::Base
  belongs_to :target, polymorphic: true
end
