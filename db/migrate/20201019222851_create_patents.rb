class CreatePatents < ActiveRecord::Migration[5.2]
  def change
    create_table :patents do |t|
      t.string :patent_number
      t.string :title
      t.date :date_of_obtaining
      t.string :industrial_publication_gazette
      t.text :observation
      t.references :category, foreign_key: true
      t.references :patent_state, foreign_key: true
      t.references :research_group, foreign_key: true

      t.timestamps
    end
  end
end
