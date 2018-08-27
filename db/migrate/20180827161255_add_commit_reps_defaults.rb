class AddCommitRepsDefaults < ActiveRecord::Migration[5.2]
  def change
    remove_column :commits, :repitions
    remove_column :commits, :repitions_completed

    change_table :commits do |t|
      t.integer :repetitions, default: 1
      t.integer :repetitions_completed, default: 0
    end
  end
end
