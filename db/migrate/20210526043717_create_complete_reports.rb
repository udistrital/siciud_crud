class CreateCompleteReports < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_reports
  end
end
