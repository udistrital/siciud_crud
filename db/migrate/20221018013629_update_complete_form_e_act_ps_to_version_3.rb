class UpdateCompleteFormEActPsToVersion3 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_form_e_act_ps, version: 3, revert_to_version: 2
  end
end
