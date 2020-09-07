class RemoveSomeColumnsFromResearchers < ActiveRecord::Migration[5.2]
  def change
    remove_column :researchers, :name, :string
    remove_column :researchers, :lastName, :string
    remove_column :researchers, :birthPlace, :string
    remove_column :researchers, :academic_email, :string
    remove_column :researchers, :snies_id, :integer


    remove_index :researchers, :document_type_id
    remove_column :researchers, :document_type_id
    remove_index :researchers, :researcher_type_id
    remove_column :researchers, :researcher_type_id
  end
end
