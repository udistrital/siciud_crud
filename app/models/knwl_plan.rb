class KnwlPlan < ApplicationRecord
  belongs_to :knwl_area, polymorphic: true
  belongs_to :form_d_act_plan
end
