class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.integer :event_id

      t.timestamps
    end
  end
end
