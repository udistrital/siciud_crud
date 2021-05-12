class UpdateCompleteBookChaptersToVersion6 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_book_chapters, version: 6, revert_to_version: 5
  end
end
