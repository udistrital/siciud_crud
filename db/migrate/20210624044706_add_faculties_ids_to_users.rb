class AddFacultiesIdsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :faculties_ids, :integer, array: true, default: []
    add_index :users, :faculties_ids, using: 'gin'
  end
end
