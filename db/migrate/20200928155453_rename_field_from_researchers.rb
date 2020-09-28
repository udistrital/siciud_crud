class RenameFieldFromResearchers < ActiveRecord::Migration[5.2]
  def change
    rename_column :researchers, :identificationNumber, :identification_number
    rename_column :researchers, :oas_researcherId, :oas_researcher_id
  end
end
