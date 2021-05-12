class UpdateCompletePapersToVersion5 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_papers, version: 5, revert_to_version: 4
  end
end
