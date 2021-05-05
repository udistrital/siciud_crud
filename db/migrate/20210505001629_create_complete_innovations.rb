class CreateCompleteInnovations < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_innovations
  end
end
