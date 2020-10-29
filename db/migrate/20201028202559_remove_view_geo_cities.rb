class RemoveViewGeoCities < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
			DROP VIEW IF EXISTS geo_cities;
    SQL
  end
end
