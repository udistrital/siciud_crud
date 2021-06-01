class CreateCompleteNonSpcPubs < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_non_spc_pubs
  end
end
