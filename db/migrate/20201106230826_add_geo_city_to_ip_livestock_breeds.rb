class AddGeoCityToIpLivestockBreeds < ActiveRecord::Migration[5.2]
  def change
    add_reference :ip_livestock_breeds, :geo_city, foreign_key: true
  end
end
