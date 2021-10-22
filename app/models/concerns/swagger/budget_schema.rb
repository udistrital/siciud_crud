module Swagger::BudgetSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
  included do
    swagger_schema :Budget do
        key :required, [:id]
        property :description do
            key :type, :string
        end
        property :ally_name do
            key :type, :string
        end
        property :used_date do
            key :type, :string
            key :format, 'date'
        end
        property :budget_type_id do
            key :type, :integer
            key :format, :int64
        end
        property :amount do
            key :type, :integer
            key :format, :int64
        end
    end

    swagger_schema :BudgetInputPost do
      allOf do
        schema do
          property :budget do
            key :'$ref', :Budget
          end
        end
        schema do
          property :budget do
                property :created_by do
                    key :type, :integer
                    key :format, :int64
                end
          end
        end
      end
    end

    swagger_schema :BudgetInputPut do
      allOf do
        schema do
          property :budget do
            key :'$ref', :Budget
          end
        end
        schema do
          property :budget do
            property :updated_by do
                key :type, :integer
                key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :BudgetOutput do
      allOf do
        schema do
          key :'$ref', :Budget
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :task_id do
            key :type, :integer
            key :format, :int64
          end
          property :active do
            key :type, :boolean
            key :default, true
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
  end
end