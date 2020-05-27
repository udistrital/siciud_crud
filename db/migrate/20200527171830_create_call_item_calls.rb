class CreateCallItemCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :call_item_calls do |t|
      t.float :percentage
      t.float :value
      t.float :maximum_percentage
      t.references :call, foreign_key: true
      t.references :item_call, foreign_key: true

      t.timestamps
    end
  end
end
