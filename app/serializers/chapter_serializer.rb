class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :ch_parent_id, :sectionable_id,
             :sectionable_type,
             :ch_order, :ch_title, :ch_description,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
