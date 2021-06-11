class CreateTrainingCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :training_courses do |t|
      t.string :institution
      t.string :id_administrative_act
      t.string :program_name
      t.date :date
      t.string :faculty
      t.string :num_administrative_act
      t.references :geo_city, foreign_key: true
      t.references :geo_state, foreign_key: true
      t.references :geo_country, foreign_key: true
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
    add_index :training_courses, :category_id
    add_foreign_key :training_courses, :subtypes, column: :category_id, primary_key: :id

    add_index :training_courses, :created_by
    add_foreign_key :training_courses, :users, column: :created_by, primary_key: :id

    add_index :training_courses, :updated_by
    add_foreign_key :training_courses, :users, column: :updated_by, primary_key: :id
  end
end
