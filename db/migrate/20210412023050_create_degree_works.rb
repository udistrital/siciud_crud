class CreateDegreeWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :degree_works do |t|
      t.string :dw_title
      t.date :dw_date
      t.string :dw_institution_name
      t.string :dw_recognition
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :dw_observation
      t.bigint :dw_type_id
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :degree_works, :category_id
    add_foreign_key :degree_works, :subtypes, column: :category_id, primary_key: :id

    add_index :degree_works, :dw_type_id
    add_foreign_key :degree_works, :subtypes, column: :dw_type_id, primary_key: :id

    add_index :degree_works, :created_by
    add_foreign_key :degree_works, :users, column: :created_by, primary_key: :id

    add_index :degree_works, :updated_by
    add_foreign_key :degree_works, :users, column: :updated_by, primary_key: :id
    
  end
end
