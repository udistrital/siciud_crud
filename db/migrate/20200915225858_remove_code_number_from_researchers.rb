class RemoveCodeNumberFromResearchers < ActiveRecord::Migration[5.2]
  def change
    remove_column :researchers, :codeNumber, :integer
  end
end
