class AddTrackingToExtParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :ext_participants, :active, :boolean, default: true

    add_column :ext_participants, :created_by, :bigint
    add_index :ext_participants, :created_by
    add_foreign_key :ext_participants, :users, column: :created_by, primary_key: :id

    add_column :ext_participants, :updated_by, :bigint
    add_index :ext_participants, :updated_by
    add_foreign_key :ext_participants, :users, column: :updated_by, primary_key: :id
  end
end
