class AddActiveToTaskAttributes < ActiveRecord::Migration[5.2]
  def change
    add_column :task_attributes, :active, :boolean, default: true
  end
end
