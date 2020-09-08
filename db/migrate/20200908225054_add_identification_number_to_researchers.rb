class AddIdentificationNumberToResearchers < ActiveRecord::Migration[5.2]
  def change
    add_column :researchers, :identificationNumber, :string
  end
end
