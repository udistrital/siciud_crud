class AddGeosToEnterpriseSecrets < ActiveRecord::Migration[5.2]
  def change
    add_reference :enterprise_secrets, :geo_state, foreign_key: true
    add_reference :enterprise_secrets, :geo_country, foreign_key: true
  end
end
