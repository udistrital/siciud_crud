class CallSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :callNumber, :registerDate, :description, :call_type_id,
             :call_user_role_id, :duration, :duration_type_id, :globalBudget, :maxBudgetPerProject,
             :startDate, :closingDate, :directedTowards, :termsOfReference, :apertureResolution,
             :addendum

  def termsOfReference
    sotr = self.object.termsOfReference
    {
        "path": (rails_blob_path(sotr, only_path: true) if sotr.attached?),
        "date": (sotr.attachment.created_at if sotr.attachment)
    }
  end

  def apertureResolution
    soar = self.object.apertureResolution
    {
        "path": (rails_blob_path(soar, only_path: true) if soar.attached?),
        "date": (soar.attachment.created_at if soar.attachment)
    }
  end

  def addendum
    soa = self.object.addendum
    {
        "path": (rails_blob_path(soa, only_path: true) if soa.attached?),
        "date": (soa.attachment.created_at if soa.attachment)
    }
  end

end
