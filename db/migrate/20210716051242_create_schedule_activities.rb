class CreateScheduleActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_activities do |t|
      t.references :call, foreign_key: true
      t.integer :sa_order
      t.text :sa_description
      t.text :sa_date
      t.string :sa_responsible
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :schedule_activities, :created_by
    add_foreign_key :schedule_activities, :users, column: :created_by, primary_key: :id

    add_index :schedule_activities, :updated_by
    add_foreign_key :schedule_activities, :users, column: :updated_by, primary_key: :id
  end
end
