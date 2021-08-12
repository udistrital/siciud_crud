class AddActiveToTaskModels < ActiveRecord::Migration[5.2]
  def change
    add_column :task_models, :active, :boolean, default: true
  end
end
