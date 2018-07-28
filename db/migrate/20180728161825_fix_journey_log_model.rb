class FixJourneyLogModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :journey_logs, :fields
    change_table :journey_logs do |t|
      t.integer :journey_id
    end
  end
end
