class AddRequiredAndMultipleToSubtypes < ActiveRecord::Migration[5.2]
  def change
    add_column :subtypes, :required, :boolean, default: false
    add_column :subtypes, :multiple, :boolean, default: false
  end
end
