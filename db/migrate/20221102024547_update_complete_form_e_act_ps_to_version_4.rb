class UpdateCompleteFormEActPsToVersion4 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_form_e_act_ps, version: 4, revert_to_version: 3
  end
end
