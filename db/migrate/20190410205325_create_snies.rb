class CreateSnies < ActiveRecord::Migration[5.2]
  def change
    create_table :snies do |t|
      t.integer :code
      t.string :name

      t.timestamps
    end
  end
end
