class AddScientificSignatureToResearchers < ActiveRecord::Migration[5.2]
  def change
    add_column :researchers, :scientific_signature, :string
  end
end
