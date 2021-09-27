class ChangeCheckDigitFromEntities < ActiveRecord::Migration[5.2]
  def change
    change_column :entities, :check_digit, :integer, limit: 2
  end
end
