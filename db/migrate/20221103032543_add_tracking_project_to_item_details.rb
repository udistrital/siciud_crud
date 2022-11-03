class AddTrackingProjectToItemDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :item_details, :state_id, :bigint
    add_index :item_details, :state_id
    add_foreign_key :item_details, :subtypes, column: :state_id, primary_key: :id

    add_column :item_details, :requested_amount, :float
    add_column :item_details, :executed_amount, :float
    add_column :item_details, :balance, :float
    add_column :item_details, :approved, :boolean, default: false
    add_column :item_details, :payments, :integer, limit: 1
    add_column :item_details, :notified_due_to_expire, :boolean, default: false
    add_column :item_details, :notified_expired, :boolean, default: false
  end
end
