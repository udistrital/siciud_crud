class CreateResearchGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :research_groups do |t|
      t.string :name
      t.string :acronym
      t.text :description
      # t.references :faculty, foreign_key: true
      # t.references :curricular_project, foreign_key: true
      t.date :cidcRegistrationDate
      t.integer :cidcActNumber
      t.integer :facultyActNumber
      t.date :facultyRegistrationDate
      t.references :state_group, foreign_key: true
      t.references :snies, foreign_key: true
      t.string :email
      t.string :gruplac
      t.string :webpage
      t.text :mission
      t.text :vision
      t.text :descripion
      # t.references :research_focus, foreign_key: true
      t.string :colcienciasCode

      t.timestamps
    end
  end
end
