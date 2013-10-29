class AddIndexToImagesEventId < ActiveRecord::Migration
  def change
    add_index :images, :event_id
  end
end
