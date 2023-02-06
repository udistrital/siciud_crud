class InventoryHistorySerializer < ActiveModel::Serializer
  attributes :id, :state_id, :active, :created_by, :updated_by
  has_one :form_e_act_plan
  has_one :usable
end
