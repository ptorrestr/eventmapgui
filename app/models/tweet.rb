class Tweet < ActiveRecord::Base
  belongs_to :event
  default_scope -> { order('created_at DESC') }
  validates :twitter_id, presence: true
  validates :twitter_text, presence: true
  validates :twitter_user_id, presence: true
  validates :twitter_screen_name, presence: true
  validates :twitter_profile_image_url, presence: true
  validates :event_id, presence: true
end
