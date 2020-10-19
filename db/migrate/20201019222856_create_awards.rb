class CreateAwards < ActiveRecord::Migration[5.2]
  def change
    create_table :awards do |t|
      t.string :name
      t.boolean :is_national

      t.timestamps
    end
  end
end
