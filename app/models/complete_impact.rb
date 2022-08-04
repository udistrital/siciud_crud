class CompleteImpact < ApplicationRecord
  self.primary_key = :id

  def readonly?
    true
  end
end
