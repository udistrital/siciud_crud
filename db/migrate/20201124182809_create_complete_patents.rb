class CreateCompletePatents < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_patents
  end
end
