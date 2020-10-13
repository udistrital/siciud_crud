# https://roberteshleman.com/blog/2014/09/18/using-postgres-views-with-rails
# https://www.netguru.com/codestories/database-views-and-how-to-use-them-in-a-ror-based-app
# app/models/research_unit.rb
class ResearchUnit < ApplicationRecord
  # https://stackoverflow.com/a/56701621
  # ActiveStorage::Current.host = request.base_url
  attribute :cidc_act_document, :default => nil
  attribute :faculty_act_document, :default => nil
  attribute :establishment_document, :default => nil
  
  self.primary_key = :id

  def readonly?
    true
  end
end