class AddImageToJourneyLog < ActiveRecord::Migration[5.2]
  def change
    change_table :journey_logs do |t|
      t.string :image
    end
  end
end
