class CreateCompleteInformativeBulletins < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_informative_bulletins
  end
end
