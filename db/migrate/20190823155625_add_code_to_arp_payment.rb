class AddCodeToArpPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :arp_payments, :cdpCode, :string
    add_column :arp_payments, :rpCode, :string
  end
end
