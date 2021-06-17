class CreateCompleteSimpleBooks < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_simple_books
  end
end
