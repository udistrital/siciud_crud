class AddColcienciasCallsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :colciencias_call, foreign_key: true
  end
end
