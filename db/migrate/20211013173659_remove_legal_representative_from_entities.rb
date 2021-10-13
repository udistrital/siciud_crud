class RemoveLegalRepresentativeFromEntities < ActiveRecord::Migration[5.2]
  def change
    remove_reference :entities, :legal_representative, foreign_key: true
  end
end
