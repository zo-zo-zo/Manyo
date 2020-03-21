class ChangeEnumColumn < ActiveRecord::Migration[5.2]

  def up
    remove_column :tasks, :status, :string
    add_column :tasks, :status, :integer
  end

  def down
    remove_column :tasks, :status, :integer
    add_column :tasks, :status, :string
  end
end
