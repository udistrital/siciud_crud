class RemoveFieldsFromFeContact < ActiveRecord::Migration[5.2]
  def change
    remove_column :fe_contacts, :last_name, :string
  end
end
