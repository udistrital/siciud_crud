class CreateArpActivityReports < ActiveRecord::Migration[5.2]
  def change
    create_table :arp_activity_reports do |t|
      t.references :arp_activy, foreign_key: true
      t.float :completedPercentage
      t.boolean :approved

      t.timestamps
    end
  end
end
