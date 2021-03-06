
module Swagger::ArpGeneralGoalSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ArpGeneralGoal do
      key :required, [:id, :name]

      property :arp_general_goal do
        property :id do
          key :type, :integer
        end
        property :goal do
          key :type, :string
        end
        property :agreement_research_project_id do
          key :type, :integer
        end
        property :completedPercentage do
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
    swagger_schema :ArpGeneralGoalPost do
      key :required, [:id, :name]

      property :arp_general_goal do
        property :goal do
          key :type, :string
        end
      end
    end
  end
end
