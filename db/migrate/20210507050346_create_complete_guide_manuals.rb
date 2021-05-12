class CreateCompleteGuideManuals < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_guide_manuals
  end
end
