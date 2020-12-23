class UpdateCompleteBookChaptersToVersion3 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_book_chapters, version: 3, revert_to_version: 2
  end
end
