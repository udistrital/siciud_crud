class CreateResearchSeedBeds < ActiveRecord::Migration[5.2]
  def change
    create_table :research_seed_beds do |t|
      t.string :name
      t.string :acronym
      t.text :description
      t.date :cidcRegistrationDate
      t.date :facultyRegistrationDate
      t.integer :cidcActNumber
      t.integer :facultyActNumber
      t.references :state_seedbed, foreign_key: true
      t.string :mail
      t.string :webpage
      t.string :mission
      t.string :vision

      t.timestamps
    end
  end
end
