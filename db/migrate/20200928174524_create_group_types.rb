class CreateGroupTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :group_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
