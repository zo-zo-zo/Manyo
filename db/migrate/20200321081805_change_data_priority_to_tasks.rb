class ChangeDataPriorityToTasks < ActiveRecord::Migration[5.2]
  def up
    remove_column :tasks, :priority, :boolean
    add_column :tasks, :priority, :integer
  end

  def down
    remove_column :tasks, :priority, :integer
    add_column :tasks, :priority, :boolean
  end
end
