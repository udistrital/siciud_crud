class CreateResearchCreationWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :research_creation_works do |t|
      t.string :title
      t.date :creation_and_selection_date
      t.string :nature_of_work
      t.string :registered_project_title
      t.string :url
      t.text :observation
      t.references :award, foreign_key: true
      t.references :knwl_spec_area, foreign_key: true
      t.references :category, foreign_key: true
      t.references :research_group, foreign_key: true

      t.timestamps
    end
  end
end
