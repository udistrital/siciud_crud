class CreateCompleteIplBreeds < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_ipl_breeds
  end
end
