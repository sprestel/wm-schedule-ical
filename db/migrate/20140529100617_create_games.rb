class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :title
      t.datetime :kickoff
      t.string :home_team
      t.string :away_team
      t.string :location
      t.timestamps
    end
  end
  
  def self.down
    drop_table :games
  end
end
