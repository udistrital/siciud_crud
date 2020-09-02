class DropFaculties < ActiveRecord::Migration[5.2]
  def change
    drop_table :faculties
  end
end
