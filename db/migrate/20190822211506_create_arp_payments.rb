class CreateArpPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :arp_payments do |t|
      t.integer :inCashValue
      t.integer :inKindValue
      t.date :date
      t.string :code
      t.string :bizagiCode
      t.references :arp_expense, foreign_key: true

      t.timestamps
    end
  end
end
