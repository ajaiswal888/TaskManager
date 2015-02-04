class ChangeDatatypePriority < ActiveRecord::Migration
  def up
  	change_column :Managers, :priority, :integer
  end

  def down
  	change_column :Managers, :priority, :string
  end
end
