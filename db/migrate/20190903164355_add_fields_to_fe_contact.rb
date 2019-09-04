class AddFieldsToFeContact < ActiveRecord::Migration[5.2]
  def change
    add_column :fe_contacts, :lastName, :string
  end
end
