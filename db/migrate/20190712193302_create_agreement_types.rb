class CreateAgreementTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :agreement_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
