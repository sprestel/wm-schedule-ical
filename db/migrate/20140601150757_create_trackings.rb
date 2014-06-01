class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.string :ip
      t.integer :download_type
      t.timestamps
    end
  end
end
