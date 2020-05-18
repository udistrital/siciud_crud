class AddInKindValueToArpExpense < ActiveRecord::Migration[5.2]
  def change
    add_column :arp_expenses, :inKindValue, :float
    add_column :arp_expenses, :inCashValue, :float
    add_column :arp_expenses, :totalPayedInCash, :float
    add_column :arp_expenses, :totalPayedInKind, :float
  end
end
