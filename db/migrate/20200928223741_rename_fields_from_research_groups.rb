class RenameFieldsFromResearchGroups < ActiveRecord::Migration[5.2]
  def change
    rename_column :research_groups, :cidcRegistrationDate, :cidc_registration_date
    rename_column :research_groups, :cidcActNumber, :cidc_act_number
    rename_column :research_groups, :facultyActNumber, :faculty_act_number
    rename_column :research_groups, :facultyRegistrationDate, :faculty_registration_date
    rename_column :research_groups, :colcienciasCode, :colciencias_code
  end
end
