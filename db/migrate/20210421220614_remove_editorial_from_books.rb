class RemoveEditorialFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :books, :editorial, foreign_key: true
  end
end
