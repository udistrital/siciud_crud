class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.references :funding_entity, foreign_key: true
      t.references :agreement, foreign_key: true
      t.float :inKindContribution
      t.float :cashContribution

      t.timestamps
    end
  end
end
