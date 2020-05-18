class RemoveFieldsFromArpPayment < ActiveRecord::Migration[5.2]
  def change
    remove_column :arp_payments, :code, :string
  end
end
