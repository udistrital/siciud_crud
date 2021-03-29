# 202103290838
# Mapea el nombre  a la vista "complete_types"
class CompleteType < ApplicationRecord
  self.primary_key = :id

  def readonly?
    true
  end
end