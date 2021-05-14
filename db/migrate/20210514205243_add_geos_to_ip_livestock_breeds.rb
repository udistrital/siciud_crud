class AddGeosToIpLivestockBreeds < ActiveRecord::Migration[5.2]
  def change
    add_reference :ip_livestock_breeds, :geo_state, foreign_key: true
    add_reference :ip_livestock_breeds, :geo_country, foreign_key: true
  end
end
