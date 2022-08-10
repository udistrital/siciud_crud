module Swagger::ProposalBudgetSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ProposalBudget do
      property :call_item_id do
        key :type, :integer
        key :format, :int64
      end
      property :amount_request_cidc do
        key :type, :number
        key :format, :float
        key :minimum, 0
        key :exclusiveMinimum, false
      end
      property :counterparty do
        key :type, :number
        key :format, :float
        key :minimum, 0
        key :exclusiveMinimum, false
      end
      property :amount_in_kind do
        key :type, :number
        key :format, :float
        key :minimum, 0
        key :exclusiveMinimum, false
      end
      property :subtotal do
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

    swagger_schema :ProposalBudgetInputPost do
      allOf do
        schema do
          property :proposal_budget do
            key :'$ref', :ProposalBudget
          end
        end
        schema do
          property :proposal_budget do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ProposalBudgetInputPut do
      allOf do
        schema do
          property :proposal_budget do
            key :'$ref', :ProposalBudget
          end
        end
        schema do
          property :proposal_budget do
            property :proposal_id do
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

    swagger_schema :ProposalBudgetOutput do
      allOf do
        schema do
          key :'$ref', :ProposalBudget
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
          property :item_id do
            key :type, :integer
            key :format, :int64
          end
          property :item_name do
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

    swagger_schema :ProposalBudgetDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ProposalBudgetOutput
            end
          end
        end
      end
    end
  end
end