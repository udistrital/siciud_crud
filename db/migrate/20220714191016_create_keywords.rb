class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :name
      t.boolean :active
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
  end
end
