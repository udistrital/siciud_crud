class AddPercentageToCallItems < ActiveRecord::Migration[5.2]
  def change
    add_column :call_items, :ci_percentage, :decimal, precision: 6, scale: 3
  end
end
