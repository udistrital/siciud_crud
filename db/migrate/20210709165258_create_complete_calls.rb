class CreateCompleteCalls < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_calls
  end
end
