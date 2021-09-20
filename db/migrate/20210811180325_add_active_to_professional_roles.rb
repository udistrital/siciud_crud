class AddActiveToProfessionalRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :professional_roles, :active, :boolean , default: true
  end
end
