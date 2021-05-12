class RemoveCategoryAndDocumentsFromIpLivestockBreeds < ActiveRecord::Migration[5.2]
  def change
    remove_reference :ip_livestock_breeds, :category, foreign_key: true
    remove_column :ip_livestock_breeds, :certificate_ma_document, :string
    remove_column :ip_livestock_breeds, :ip_livestock_breed_document, :string
  end
end
