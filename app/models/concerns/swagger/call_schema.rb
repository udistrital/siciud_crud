module Swagger::CallSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Call do
      property :call_name do
        key :type, :string
      end
      property :call_beneficiary_id do
        key :type, :integer
        key :format, :int64
      end
      property :call_directed_towards do
        key :type, :string
      end
      property :call_duration do
        key :type, :integer
        key :format, :int64
      end
      property :call_global_budget do
        key :type, :number
        key :format, :float
      end
      property :call_max_budget_per_project do
        key :type, :number
        key :format, :float
      end
      property :call_state_id do
        key :type, :integer
        key :format, :int64
      end
      property :call_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :call_objective do
        key :type, :string
      end
      property :call_start_date do
        key :type, :string
        key :format, :date
      end
      property :call_end_date do
        key :type, :string
        key :format, :date
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :CallInputPost do
      allOf do
        schema do
          property :call do
            key :'$ref', :Call
          end
        end
        schema do
          property :call do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :CallInputPut do
      allOf do
        schema do
          property :call do
            key :'$ref', :Call
          end
        end
        schema do
          property :call do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :CallOutput do
      allOf do
        schema do
          key :'$ref', :Call
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :call_beneficiary_name do
            key :type, :string
          end
          property :call_code do
            key :type, :string
          end
          property :call_state_name do
            key :type, :string
          end
          property :call_type_name do
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

    swagger_schema :CallDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :CallOutput
            end
          end
        end
      end
    end
  end
end