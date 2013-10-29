class Image < ActiveRecord::Base
  belongs_to :event
  default_scope -> { order('created_at DESC') }
  validates :url, presence: true
  validates :event_id, presence: true
end
