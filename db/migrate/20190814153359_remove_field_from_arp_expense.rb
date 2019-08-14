class RemoveFieldFromArpExpense < ActiveRecord::Migration[5.2]
  def change
    remove_column :arp_expenses, :value, :float
  end
end
