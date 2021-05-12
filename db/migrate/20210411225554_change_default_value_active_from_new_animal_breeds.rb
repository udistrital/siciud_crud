class ChangeDefaultValueActiveFromNewAnimalBreeds < ActiveRecord::Migration[5.2]
  def change
    change_column_default :new_scientific_records, :active, true
  end
end
