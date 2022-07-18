module Swagger::ResearchGroupsProposalSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ResearchGroupsProposal do
      property :role_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ResearchGroupsProposalInputPost do
      allOf do
        schema do
          property :research_groups_proposal do
            key :'$ref', :ResearchGroupsProposal
          end
        end
        schema do
          property :research_groups_proposal do
            property :research_group_id do
              key :type, :integer
              key :format, :int64
            end
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ResearchGroupsProposalInputPut do
      allOf do
        schema do
          property :research_groups_proposal do
            key :'$ref', :ResearchGroupsProposal
          end
        end
        schema do
          property :research_groups_proposal do
            property :proposal_id do
              key :type, :integer
              key :format, :int64
            end
            property :research_group_id do
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

    swagger_schema :ResearchGroupsProposalOutput do
      allOf do
        schema do
          key :'$ref', :ResearchGroupsProposal
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :proposal_id do
            key :type, :integer
            key :format, :int64
          end
          property :role_name do
            key :type, :string
          end
          property :research_unit do
            key :type, :object
            property :id do
              key :type, :integer
              key :format, :int64
            end
            property :name do
              key :type, :string
            end
            property :acronym do
              key :type, :string
            end
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

    swagger_schema :ResearchGroupsProposalDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ResearchGroupsProposalOutput
            end
          end
        end
      end
    end
  end
end