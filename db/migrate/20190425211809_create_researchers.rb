class CreateResearchers < ActiveRecord::Migration[5.2]
  def change
    create_table :researchers do |t|
      t.integer :codeNumber
      t.integer :identificationNumber
      t.string :name
      t.string :lastName
      t.references :document_type, foreign_key: true
      t.string :birthPlace
      t.references :faculty, foreign_key: true
      t.references :curricular_project, foreign_key: true
      t.references :snies, foreign_key: true
      t.references :genre, foreign_key: true
      t.references :state_researcher, foreign_key: true
      t.string :telNumber
      t.string :celNumber
      t.string :address
      t.string :academicEmail
      t.string :personalEmail

      t.timestamps
    end
  end
end
