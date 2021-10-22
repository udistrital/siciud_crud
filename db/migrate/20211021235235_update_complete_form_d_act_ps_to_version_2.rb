class UpdateCompleteFormDActPsToVersion2 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_form_d_act_ps, version: 2, revert_to_version: 1
  end
end
