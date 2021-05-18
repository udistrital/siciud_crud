class CreateCompleteWorkingPapers < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_working_papers
  end
end
