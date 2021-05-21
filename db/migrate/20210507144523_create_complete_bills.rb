class CreateCompleteBills < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_bills
  end
end
