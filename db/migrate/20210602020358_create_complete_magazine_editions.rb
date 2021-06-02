class CreateCompleteMagazineEditions < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_magazine_editions
  end
end
