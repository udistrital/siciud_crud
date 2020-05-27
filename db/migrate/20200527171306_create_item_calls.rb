class CreateItemCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :item_calls do |t|
      t.string :item

      t.timestamps
    end
  end
end
