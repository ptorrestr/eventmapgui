class AddIndexToVideosEventId < ActiveRecord::Migration
  def change
    add_index :videos, :event_id
  end
end
