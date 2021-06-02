class CreateCompleteNewGeneticSequences < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_new_genetic_sequences
  end
end
