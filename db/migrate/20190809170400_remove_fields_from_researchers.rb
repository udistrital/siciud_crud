class RemoveFieldsFromResearchers < ActiveRecord::Migration[5.2]
  def change
    remove_column :researchers, :address, :string
    remove_column :researchers, :personalEmail, :string
    remove_column :researchers, :academicEmail, :string
    remove_reference :researchers, :genre, foreign_key: true
    remove_column :researchers, :telNumber, :string
  end
end
