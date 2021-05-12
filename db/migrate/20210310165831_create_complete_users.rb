class CreateCompleteUsers < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_users
  end
end
