class AddMobileAndPhoneNumberToResearchers < ActiveRecord::Migration[5.2]
  def change
    add_column :researchers, :mobile_number_two, :string
    add_column :researchers, :phone_number_one, :string
    add_column :researchers, :phone_number_two, :string
  end
end
