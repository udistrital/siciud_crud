class CreateWorkingPapers < ActiveRecord::Migration[5.2]
  def change
    create_table :working_papers do |t|
      t.string :title
      t.date :elaboration_date
      t.string :related_institution
      t.string :doi
      t.string :web_page
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :working_papers, :category_id
    add_foreign_key :working_papers, :subtypes, column: :category_id, primary_key: :id

    add_index :working_papers, :created_by
    add_foreign_key :working_papers, :users, column: :created_by, primary_key: :id

    add_index :working_papers, :updated_by
    add_foreign_key :working_papers, :users, column: :updated_by, primary_key: :id

  end
end
