class CreateCompleteBooks < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_books
  end
end
