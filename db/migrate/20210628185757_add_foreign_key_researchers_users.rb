class AddForeignKeyResearchersUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :researchers, :identification_number, unique: true
    add_index :users, :identification_number, unique: true

    add_foreign_key :researchers, :users, column: :identification_number, primary_key: :identification_number, on_delete: :cascade
  end
end
