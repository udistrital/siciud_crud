class AddTrackingToResearchFocuses < ActiveRecord::Migration[5.2]
  def change
    add_column :research_focuses, :active, :boolean, default: true

    add_column :research_focuses, :created_by, :bigint
    add_index :research_focuses, :created_by
    add_foreign_key :research_focuses, :users, column: :created_by, primary_key: :id

    add_column :research_focuses, :updated_by, :bigint
    add_index :research_focuses, :updated_by
    add_foreign_key :research_focuses, :users, column: :updated_by, primary_key: :id

    change_column_default :research_focuses, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :research_focuses, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
