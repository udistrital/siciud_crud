
module Swagger::ApSpecificGoalSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ApSpecificGoal do
      key :required, [:id, :name]

      property :ap_specific_goal do
        property :id do
          key :type, :integer
        end
        property :goal do
          key :type, :string
        end
        property :ap_general_goal_id do
          key :type, :integer
        end
      end
    end
    swagger_schema :ApSpecificGoalPost do
      key :required, [:id, :name]

      property :ap_specific_goal do
        property :goal do
          key :type, :string
        end
      end
    end
  end
end
