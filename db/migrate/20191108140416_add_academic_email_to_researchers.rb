class AddAcademicEmailToResearchers < ActiveRecord::Migration[5.2]
  def change
    add_column :researchers, :academic_email, :string
  end
end
