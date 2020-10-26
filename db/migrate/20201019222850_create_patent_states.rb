class CreatePatentStates < ActiveRecord::Migration[5.2]
  def change
    create_table :patent_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
