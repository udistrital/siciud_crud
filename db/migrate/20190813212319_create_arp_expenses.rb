class CreateArpExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :arp_expenses do |t|
      t.string :name
      t.float :value
      t.float :totalPayed
      t.float :remaining
      t.string :description
      t.date :date
      t.boolean :is_payed
      t.string :code
      t.string :bizagiCode
      t.references :contribution_rp_item, foreign_key: true

      t.timestamps
    end
  end
end
