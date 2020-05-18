class AddRemainingInCashToArpExpense < ActiveRecord::Migration[5.2]
  def change
    add_column :arp_expenses, :remainingInCash, :float
    add_column :arp_expenses, :remainingInKind, :float
  end
end
