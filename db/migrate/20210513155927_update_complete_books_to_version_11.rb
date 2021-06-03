class UpdateCompleteBooksToVersion11 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_books, version: 11, revert_to_version: 10
  end
end
