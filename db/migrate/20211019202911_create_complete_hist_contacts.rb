class CreateCompleteHistContacts < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_hist_contacts
  end
end
