
module Swagger::ApActivitySchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ApActivity do
      key :required, [:id, :name]

      property :ap_activity do
        property :id do
          key :type, :integer
        end
        property :ap_specific_goal_id do
          key :type, :integer
        end
        property :activity do
          key :type, :string
        end
        property :completedPercentage do
          key :type, :integer
        end
        property :weight do
          key :type, :integer
        end
      end
    end
    swagger_schema :ApActivityPost do
      key :required, [:id, :name]

      property :ap_activity do
        property :activity do
          key :type, :string
        end
        property :weight do
          key :type, :integer
        end
      end
    end
  end
end
