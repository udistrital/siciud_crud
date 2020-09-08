class RemoveIdentificationNumberFromResearchers < ActiveRecord::Migration[5.2]
  def change
    remove_column :researchers, :identificationNumber, :integer
  end
end
