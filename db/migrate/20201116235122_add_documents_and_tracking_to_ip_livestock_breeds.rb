class AddDocumentsAndTrackingToIpLivestockBreeds < ActiveRecord::Migration[5.2]
  def change
    add_column :ip_livestock_breeds, :certificate_ma_document, :string
    add_column :ip_livestock_breeds, :ip_livestock_breed_document, :string
    add_column :ip_livestock_breeds, :active, :boolean, default: true

    add_column :ip_livestock_breeds, :created_by, :bigint
    add_index :ip_livestock_breeds, :created_by
    add_foreign_key :ip_livestock_breeds, :users, column: :created_by, primary_key: :id

    add_column :ip_livestock_breeds, :updated_by, :bigint
    add_index :ip_livestock_breeds, :updated_by
    add_foreign_key :ip_livestock_breeds, :users, column: :updated_by, primary_key: :id
  end
end
