class CreateFeContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :fe_contacts do |t|
      t.string :name
      t.string :last_name
      t.string :phoneNumber
      t.string :mobileNumber
      t.string :role
      t.string :email
      t.references :funding_entity, foreign_key: true

      t.timestamps
    end
  end
end
