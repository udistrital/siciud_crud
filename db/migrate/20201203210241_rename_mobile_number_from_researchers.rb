class RenameMobileNumberFromResearchers < ActiveRecord::Migration[5.2]
  def change
    rename_column :researchers, :mobile_number, :mobile_number_one
  end
end
