class AddIdentificationNumberAndOthersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :identification_number, :string
    add_column :users, :oas_user_id, :string
    add_reference :users, :user_role, foreign_key: true
    add_column :users, :active, :boolean
    add_column :users, :created_by, :bigint
    add_column :users, :updated_by, :bigint
  end
end
