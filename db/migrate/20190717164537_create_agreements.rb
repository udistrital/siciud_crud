class CreateAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :agreements do |t|
      t.string :name
      t.date :registerDate
      t.date :startDate
      t.date :finalDate
      t.integer :agreementNumber
      t.references :faculty, foreign_key: true
      t.references :agreement_status, foreign_key: true
      t.references :agreement_type, foreign_key: true

      t.timestamps
    end
  end
end
