class CreateCallProductions < ActiveRecord::Migration[5.2]
  def change
    create_table :call_productions do |t|
      t.boolean :required
      t.integer :quantity
      t.references :call, foreign_key: true
      t.references :production, foreign_key: true

      t.timestamps
    end
  end
end
