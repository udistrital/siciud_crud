class ResearchCreationWorkSerializer < ActiveModel::Serializer
  attributes :id, :title, :creation_and_selection_date, :nature_of_work, :registered_project_title, :url, :observation
  has_one :award
  has_one :knwl_spec_area
  has_one :category
  has_one :research_group
end
