class CompleteTrainingCourse < ApplicationRecord
  self.primary_key = :id

  def readonly?
    true
  end
end
