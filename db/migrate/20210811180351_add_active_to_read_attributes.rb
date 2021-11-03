class AddActiveToReadAttributes < ActiveRecord::Migration[5.2]
  def change
    add_column :read_attributes, :active, :boolean, default: true
  end
end
