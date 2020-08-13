class CreateOecdDisciplines < ActiveRecord::Migration[5.2]
  def change
    create_table :oecd_disciplines do |t|
      t.string :name
      t.string :code
      t.references :oecd_knowledge_subarea, foreign_key: true

      t.timestamps
    end
  end
end
