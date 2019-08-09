class RemoveFieldFromResearchers < ActiveRecord::Migration[5.2]
  def change
    remove_column :researchers, :celNumber, :string
    remove_column :researchers, :Address, :string
  end
end
