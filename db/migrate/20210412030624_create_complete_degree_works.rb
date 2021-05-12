class CreateCompleteDegreeWorks < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_degree_works
  end
end
