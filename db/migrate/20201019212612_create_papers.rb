class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.string :title
      t.date :publication_date
      t.date :approval_date
      t.string :volume
      t.integer :number_of_pages
      t.integer :initial_page
      t.integer :final_page
      t.string :issn
      t.string :url
      t.string :doi
      t.text :observation
      t.references :category, foreign_key: true
      t.references :journal, foreign_key: true
      t.references :paper_type, foreign_key: true
      t.references :research_group, foreign_key: true

      t.timestamps
    end
  end
end
