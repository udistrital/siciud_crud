class RemoveFieldStateGroupFromResearcher < ActiveRecord::Migration[5.2]
  def change
    remove_reference :researchers, :state_researcher, foreign_key: true
  end
end
