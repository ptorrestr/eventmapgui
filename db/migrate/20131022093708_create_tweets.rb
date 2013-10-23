class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :twitter_id
      t.string :twitter_text
      t.integer :twitter_user_id
      t.string :twitter_screen_name
      t.string :twitter_profile_image_url
      t.integer :event_id

      t.timestamps
    end
  end
end
