class RemoveFieldFromAgreements < ActiveRecord::Migration[5.2]
  def change
    remove_reference :agreements, :faculty, foreign_key: true
  end
end
