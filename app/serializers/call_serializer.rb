class CallSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :callNumber, :registerDate, :description, :call_type_id,
             :call_user_role_id, :duration, :duration_type_id, :globalBudget, :maxBudgetPerProject,
             :startDate, :closingDate, :directedTowards, :termsOfReference, :tor_date,
             :apertureResolution, :ar_date, :addendum, :ad_date

  def termsOfReference
    sotr = self.object.termsOfReference
    rails_blob_path(sotr, only_path: true) if sotr.attached?
  end

  def tor_date
    sotr = self.object.termsOfReference
    sotr.attachment.created_at if sotr.attachment
  end

  def apertureResolution
    soar = self.object.apertureResolution
    rails_blob_path(soar, only_path: true) if soar.attached?
  end

  def ar_date
    soar = self.object.apertureResolution
    soar.attachment.created_at if soar.attachment
  end

  def addendum
    soa = self.object.addendum
    rails_blob_path(soa, only_path: true) if soa.attached?
  end

  def ad_date
    soa = self.object.addendum
    soa.attachment.created_at if soa.attachment
  end
end
