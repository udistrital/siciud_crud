class AddPhoneNumberToFundingEntities < ActiveRecord::Migration[5.2]
  def change
    add_column :funding_entities, :phoneNumber, :string
  end
end
