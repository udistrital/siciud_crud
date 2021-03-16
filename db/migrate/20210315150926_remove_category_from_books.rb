class RemoveCategoryFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :books, :category, foreign_key: true
  end
end
