class CreateCompletePltIndProts < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_plt_ind_prots
  end
end
