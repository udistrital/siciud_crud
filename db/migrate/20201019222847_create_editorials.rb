class CreateEditorials < ActiveRecord::Migration[5.2]
  def change
    create_table :editorials do |t|
      t.string :name

      t.timestamps
    end
  end
end
