class CreateCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :calls do |t|
      t.integer :callNumber
      t.date :registerDate
      t.text :description
      t.references :call_type, foreign_key: true
      t.references :call_user_role, foreign_key: true
      t.integer :duration
      t.float :globalBudget
      t.float :maxBudgetPerProject
      t.date :startDate
      t.date :closingDate
      t.text :directedTowards

      t.timestamps
    end
  end
end
