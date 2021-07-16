class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.references :sectionable, polymorphic: true
      t.bigint :ch_parent_id
      t.integer :ch_order
      t.text :ch_title
      t.text :ch_description
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :chapters, :ch_parent_id
    add_foreign_key :chapters, :chapters, column: :ch_parent_id, primary_key: :id

    add_index :chapters, :created_by
    add_foreign_key :chapters, :users, column: :created_by, primary_key: :id

    add_index :chapters, :updated_by
    add_foreign_key :chapters, :users, column: :updated_by, primary_key: :id
  end
end
