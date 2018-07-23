class CreateJourneyLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :journey_logs do |t|
      t.json :fields
      
      t.timestamps
    end
  end
end
