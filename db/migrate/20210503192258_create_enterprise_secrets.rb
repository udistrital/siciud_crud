class CreateEnterpriseSecrets < ActiveRecord::Migration[5.2]
  def change
    create_table :enterprise_secrets do |t|
      t.string :name
      t.string :contract_number
      t.float :contract_value
      t.date :date_of_obtaining
      t.references :geo_city, foreign_key: true
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :enterprise_secrets, :category_id
    add_foreign_key :enterprise_secrets, :subtypes, column: :category_id, primary_key: :id

    add_index :enterprise_secrets, :created_by
    add_foreign_key :enterprise_secrets, :users, column: :created_by, primary_key: :id

    add_index :enterprise_secrets, :updated_by
    add_foreign_key :enterprise_secrets, :users, column: :updated_by, primary_key: :id

  end
end
