class UpdateCompletePltIndProtsToVersion4 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_plt_ind_prots, version: 4, revert_to_version: 3
  end
end
