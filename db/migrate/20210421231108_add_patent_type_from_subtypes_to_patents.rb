class AddPatentTypeFromSubtypesToPatents < ActiveRecord::Migration[5.2]
  def change
    add_column :patents, :patent_type_id, :bigint
    add_index :patents, :patent_type_id
    add_foreign_key :patents, :subtypes, column: :patent_type_id, primary_key: :id
  end
end
