module Swagger::ProposalProductSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ProposalProduct do
      property :name do
        key :type, :string
      end
      property :product_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :indicator_id do
        key :type, :integer
        key :format, :int64
      end
      property :beneficiary do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ProposalProductInputPost do
      allOf do
        schema do
          property :proposal_product do
            key :'$ref', :ProposalProduct
          end
        end
        schema do
          property :proposal_product do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ProposalProductInputPut do
      allOf do
        schema do
          property :proposal_product do
            key :'$ref', :ProposalProduct
          end
        end
        schema do
          property :proposal_product do
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

    swagger_schema :ProposalProductOutput do
      allOf do
        schema do
          key :'$ref', :ProposalProduct
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
          property :product_type_name do
            key :type, :string
          end
          property :indicator_description do
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

    swagger_schema :ProposalProductDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ProposalProductOutput
            end
          end
        end
      end
    end
  end
end