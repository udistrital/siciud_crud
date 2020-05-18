class CreateArpRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :arp_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
