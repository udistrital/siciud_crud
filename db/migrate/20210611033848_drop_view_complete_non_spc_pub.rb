class DropViewCompleteNonSpcPub < ActiveRecord::Migration[5.2]
  def change
    drop_view :complete_non_spc_pubs
  end
end
