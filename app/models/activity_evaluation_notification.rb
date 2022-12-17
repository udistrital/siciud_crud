class ActivityEvaluationNotification < ApplicationRecord
  self.primary_key = :proposal_id

  def readonly?
    true
  end
end
