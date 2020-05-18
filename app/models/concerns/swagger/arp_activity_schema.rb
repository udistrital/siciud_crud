
module Swagger::ArpActivitySchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ArpActivity do
      key :required, [:id, :name]

      property :arp_activity do
        property :id do
          key :type, :integer
        end
        property :arp_specific_goal_id do
          key :type, :integer
        end
        property :activity do
          key :type, :string
        end
        property :completedPercentage do
          key :type, :integer
        end
      end
    end
    swagger_schema :ArpActivityPost do
      key :required, [:id, :name]

      property :arp_activity do
        property :activity do
          key :type, :string
        end
      end
    end
  end
end
