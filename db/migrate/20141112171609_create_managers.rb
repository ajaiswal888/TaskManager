class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :task
      t.datetime :due_date
      t.integer :priority

      t.timestamps
    end
  end
end
