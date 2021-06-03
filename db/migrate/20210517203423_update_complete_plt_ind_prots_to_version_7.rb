class UpdateCompletePltIndProtsToVersion7 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_plt_ind_prots, version: 7, revert_to_version: 6
  end
end
