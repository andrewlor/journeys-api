class CreateDataPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :data_points do |t|
      t.integer :data
      t.integer :unit
      t.integer :journey_log_id
      t.integer :journey_id

      t.timestamps
    end
  end
end
