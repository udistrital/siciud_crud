class UpdateCompletePltIndProtsToVersion6 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_plt_ind_prots, version: 6, revert_to_version: 5
  end
end
