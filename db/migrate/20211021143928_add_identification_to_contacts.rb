class AddIdentificationToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :identification_number, :string
    add_column :contacts, :identification_type_id, :bigint

    add_index :contacts, :identification_number

    add_index :contacts, :identification_type_id
    add_foreign_key :contacts, :subtypes, column: :identification_type_id, primary_key: :id
  end
end
