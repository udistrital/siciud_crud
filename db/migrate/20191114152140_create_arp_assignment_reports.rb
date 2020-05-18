class CreateArpAssignmentReports < ActiveRecord::Migration[5.2]
  def change
    create_table :arp_assignment_reports do |t|
      t.text :comment
      t.integer :percentage
      t.integer :status
      t.references :arp_assignment, foreign_key: true

      t.timestamps
    end
  end
end
