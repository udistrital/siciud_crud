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
      property :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_country_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_state_id do
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
            property :dependency_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :entity_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :research_group_ids do
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
            property :dependency_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :entity_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
            property :research_group_ids do
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
          property :geo_city_name do
            key :type, :string
          end
          property :geo_country_name do
            key :type, :string
          end
          property :geo_state_name do
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
          property :entities do
            key :type, :array
            items do
              property :entity_id do
                key :type, :integer
                key :format, :int64
              end
              property :entity_name do
                key :type, :string
              end
              property :dependencies do
                key :type, :array
                items do
                  property :dependency_id do
                    key :type, :integer
                    key :format, :int64
                  end
                  property :dependency_name do
                    key :type, :string
                  end
                end
              end
            end
          end
          property :research_groups do
            key :type, :array
            items do
              property :research_group_id do
                key :type, :integer
                key :format, :int64
              end
              property :research_group_name do
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