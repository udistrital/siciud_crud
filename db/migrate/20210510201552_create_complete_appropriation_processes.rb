class CreateCompleteAppropriationProcesses < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_appropriation_processes
  end
end
