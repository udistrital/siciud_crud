module Swagger::RgResearchNetworkSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ResearchGroupsResearchNetwork do
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :has_expiration do
        key :type, :boolean
        key :default, false
      end
      property :expiration_date do
        key :type, :string
        key :format, :date
        key :example, "2023-12-31"
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ResearchGroupsResearchNetworkInputPost do
      allOf do
        schema do
          property :research_groups_research_network do
            key :'$ref', :ResearchGroupsResearchNetwork
          end
        end
        schema do
          property :research_groups_research_network do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ResearchGroupsResearchNetworkInputPut do
      allOf do
        schema do
          property :research_groups_research_network do
            key :'$ref', :ResearchGroupsResearchNetwork
          end
        end
        schema do
          property :research_groups_research_network do
            property :research_network_id do
              key :type, :integer
              key :format, :int64
            end
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ResearchGroupsResearchNetworkOutput do
      allOf do
        schema do
          key :'$ref', :ResearchGroupsResearchNetwork
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :research_group_name do
            key :type, :string
          end
          property :created_by do
            key :type, :integer
            key :format, :int64
          end
          property :updated_by do
            key :type, :integer
            key :format, :int64
          end
          property :created_at do
            key :type, :string
            key :format, 'date-time'
          end
          property :updated_at do
            key :type, :string
            key :format, 'date-time'
          end
        end
      end
    end

    swagger_schema :ResearchGroupsResearchNetworkDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ResearchGroupsResearchNetworkOutput
            end
          end
        end
      end
    end
  end
end