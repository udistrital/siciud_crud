class AddColcienciasCallsToBookChapters < ActiveRecord::Migration[5.2]
  def change
    add_reference :book_chapters, :colciencias_call, foreign_key: true
  end
end
