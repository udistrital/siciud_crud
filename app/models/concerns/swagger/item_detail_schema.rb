module Swagger::ItemDetailSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ItemDetail do
      property :proposal_budget_id do
        key :type, :integer
        key :format, :int64
      end
      property :description do
        key :type, :string
      end
      property :justification do
        key :type, :string
      end
      property :estimated_date do
        key :type, :string
        key :format, :date
      end
      property :quantity do
        key :type, :integer
        key :format, :int64
      end
      property :individual_cost do
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

    swagger_schema :ItemDetailInputPost do
      allOf do
        schema do
          property :item_detail do
            key :'$ref', :ItemDetail
          end
        end
        schema do
          property :item_detail do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ItemDetailInputPut do
      allOf do
        schema do
          property :item_detail do
            key :'$ref', :ItemDetail
          end
        end
        schema do
          property :item_detail do
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

    swagger_schema :ItemDetailOutput do
      allOf do
        schema do
          key :'$ref', :ItemDetail
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

    swagger_schema :ItemDetailDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ItemDetailOutput
            end
          end
        end
      end
    end
  end
end