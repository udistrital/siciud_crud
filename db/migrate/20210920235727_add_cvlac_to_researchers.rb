class AddCvlacToResearchers < ActiveRecord::Migration[5.2]
  def change
    add_column :researchers, :cvlac, :string
  end
end
