class AddFieldsFromResearchers < ActiveRecord::Migration[5.2]
  def change
    add_column :researchers, :mobile_number, :string
    add_column :researchers, :address, :string
  end
end
