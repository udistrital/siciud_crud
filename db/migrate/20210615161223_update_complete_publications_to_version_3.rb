class UpdateCompletePublicationsToVersion3 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_publications, version: 3, revert_to_version: 2
  end
end