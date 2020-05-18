class AddDescriptionToAgreeements < ActiveRecord::Migration[5.2]
  def change
    add_column :agreements, :description, :text
  end
end
