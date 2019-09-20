
module Swagger::ArpSpecificGoalSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ArpSpecificGoal do
      key :required, [:id, :name]

      property :arp_specific_goal do
        property :id do
          key :type, :integer
        end
        property :goal do
          key :type, :string
        end
        property :arp_general_goal_id do
          key :type, :integer
        end
        property :completedPercentage do
          key :type, :integer
        end
        property :weight do
          key :type, :integer
        end
        property :assignedWeight do
          key :type, :integer
        end
        property :remaingWeight do
          key :type, :integer
        end
      end
    end
    swagger_schema :ArpSpecificGoalPost do
      key :required, [:id, :name]

      property :arp_specific_goal do
        property :goal do
          key :type, :string
        end
        property :weight do
          key :type, :integer
        end
      end
    end
  end
end
