class AddMobileAndAddressToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :mobile, :string
    add_column :contacts, :address, :string
  end
end
