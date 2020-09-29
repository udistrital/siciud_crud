class CreateGmStates < ActiveRecord::Migration[5.2]
  def change
    create_table :gm_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
