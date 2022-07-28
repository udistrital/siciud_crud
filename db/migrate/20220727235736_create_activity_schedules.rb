class CreateActivitySchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_schedules do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :duration, limit: 2
      t.text :deliverable
      t.references :proposal, foreign_key: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :activity_schedules, :created_by
    add_foreign_key :activity_schedules, :users, column: :created_by, primary_key: :id

    add_index :activity_schedules, :updated_by
    add_foreign_key :activity_schedules, :users, column: :updated_by, primary_key: :id

  end
end
