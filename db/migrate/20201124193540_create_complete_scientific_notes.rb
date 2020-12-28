class CreateCompleteScientificNotes < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_scientific_notes
  end
end
