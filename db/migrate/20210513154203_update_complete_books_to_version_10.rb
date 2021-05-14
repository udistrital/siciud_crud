class UpdateCompleteBooksToVersion10 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_books, version: 10, revert_to_version: 9
  end
end
