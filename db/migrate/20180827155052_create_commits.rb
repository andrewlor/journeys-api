class CreateCommits < ActiveRecord::Migration[5.2]
  def change
    create_table :commit_periods do |t|
      t.integer :journey_id
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps
    end
    
    create_table :commits do |t|
      t.integer :commit_period_id
      t.string :description
      t.integer :repitions
      t.integer :repitions_completed
    end
  end
end
