class CreateHistContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :hist_contacts do |t|
      t.references :contact, foreign_key: true
      t.references :dependency, foreign_key: true
      t.boolean :is_current, default: false
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :hist_contacts, :created_by
    add_foreign_key :hist_contacts, :users, column: :created_by, primary_key: :id

    add_index :hist_contacts, :updated_by
    add_foreign_key :hist_contacts, :users, column: :updated_by, primary_key: :id
  end
end
