class InventoryHistory < ApplicationRecord
  belongs_to :form_e_act_plan
  belongs_to :usable, polymorphic: true
end
