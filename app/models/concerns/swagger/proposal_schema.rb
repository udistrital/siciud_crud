module Swagger::ProposalSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Proposal do
      property :title do
        key :type, :string
      end
      property :description do
        key :type, :string
      end
      property :duration do
        key :type, :integer
        key :format, :int64
      end
      property :proposal_status_id do
        key :type, :integer
        key :format, :int64
      end
      property :project_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :total_amount_in_kind do
        key :type, :number
        key :format, :float
        key :minimum, 0
        key :exclusiveMinimum, false
      end
      property :total_amount_request_cidc do
        key :type, :number
        key :format, :float
        key :minimum, 0
        key :exclusiveMinimum, false
      end
      property :total_counterparty do
        key :type, :number
        key :format, :float
        key :minimum, 0
        key :exclusiveMinimum, false
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ProposalInputPost do
      allOf do
        schema do
          property :proposal do
            key :'$ref', :Proposal
          end
        end
        schema do
          property :proposal do
            property :geo_city_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :research_focus_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ProposalInputPut do
      allOf do
        schema do
          property :proposal do
            key :'$ref', :Proposal
          end
        end
        schema do
          property :proposal do
            property :call_id do
              key :type, :integer
              key :format, :int64
            end
            property :geo_city_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :research_focus_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :BaseProposalOutput do
      allOf do
        schema do
          key :'$ref', :Proposal
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :call_id do
            key :type, :integer
            key :format, :int64
          end
          property :call_code do
            key :type, :string
          end
          property :call_name do
            key :type, :string
          end
          property :proposal_status_name do
            key :type, :string
          end
          property :project_type_name do
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

    swagger_schema :ProposalOutput do
      allOf do
        schema do
          key :'$ref', :BaseProposalOutput
        end
        schema do
          property :geo_cities do
            key :type, :array
            items do
              property :geo_city_id do
                key :type, :integer
                key :format, :int64
              end
              property :geo_city_name do
                key :type, :string
              end
            end
          end
          property :research_focuses do
            key :type, :array
            items do
              property :research_focus_id do
                key :type, :integer
                key :format, :int64
              end
              property :research_focus_name do
                key :type, :string
              end
            end
          end
        end
      end
    end

    swagger_schema :BaseProposalOutputDx do
      allOf do
        schema do
          key :'$ref', :BaseProposalOutput
        end
        schema do
          property :total_geo_cities do
            key :type, :integer
            key :format, :int64
          end
          property :total_research_focuses do
            key :type, :integer
            key :format, :int64
          end
          property :total_dependencies do
            key :type, :integer
            key :format, :int64
          end
          property :total_entities do
            key :type, :integer
            key :format, :int64
          end
          property :total_research_groups do
            key :type, :integer
            key :format, :int64
          end
        end
      end
    end

    swagger_schema :ProposalDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :BaseProposalOutputDx
            end
          end
        end
      end
    end
  end
end