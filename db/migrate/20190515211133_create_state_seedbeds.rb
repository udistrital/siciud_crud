class CreateStateSeedbeds < ActiveRecord::Migration[5.2]
  def change
    create_table :state_seedbeds do |t|
      t.string :name

      t.timestamps
    end
  end
end
