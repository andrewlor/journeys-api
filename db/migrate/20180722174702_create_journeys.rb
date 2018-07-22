class CreateJourneys < ActiveRecord::Migration[5.2]
  def change
    create_table :journeys do |t|
      t.integer :user_id
      t.string :title
      t.text :mission_statement
      
      t.timestamps
    end
  end
end
