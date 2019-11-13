class CreateArpAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :arp_assignments do |t|
      t.string :name
      t.references :product_typology, foreign_key: true
      t.references :agreement_research_project, foreign_key: true

      t.timestamps
    end
  end
end
