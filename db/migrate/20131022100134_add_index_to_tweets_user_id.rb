class AddIndexToTweetsUserId < ActiveRecord::Migration
  def change
    add_index :tweets, :event_id
  end
end
