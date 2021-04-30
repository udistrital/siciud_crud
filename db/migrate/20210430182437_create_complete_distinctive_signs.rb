class CreateCompleteDistinctiveSigns < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_distinctive_signs
  end
end
