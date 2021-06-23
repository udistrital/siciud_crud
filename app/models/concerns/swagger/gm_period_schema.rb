module Swagger::GmPeriodSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :GmPeriod do
      property :initial_date do
        key :type, :string
        key :format, :date
        key :example, "2018-01-20"
      end
      property :final_date do
        key :type, :string
        key :format, :date
        key :example, "2018-01-20"
      end
      property :role_id do
        key :type, :integer
        key :format, :int64
        key :example, 1
      end
      property :group_member_id do
        key :type, :integer
        key :format, :int64
        key :example, 1
      end
      property :is_current do
        key :type, :boolean
        key :default, true
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :GmPeriodInputPut do
      allOf do
        schema do
          property :gm_period do
            key :'$ref', :GmPeriod
          end
        end
        schema do
          property :gm_period do
            property :updated_by do
              key :type, :integer
              key :format, :int64
              key :example, 1
            end
          end
        end
      end
    end

    swagger_schema :GmPeriodInputPost do
      allOf do
        schema do
          property :gm_period do
            key :'$ref', :GmPeriod
          end
        end
        schema do
          property :gm_period do
            property :created_by do
              key :type, :integer
              key :format, :int64
              key :example, 1
            end
          end
        end
      end
    end

    swagger_schema :GmPeriodOutput do
      allOf do
        schema do
          key :'$ref', :GmPeriod
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
            key :example, 1
          end
          property :created_by do
            key :type, :integer
            key :format, :int64
            key :example, 1
          end
          property :updated_by do
            key :type, :integer
            key :format, :int64
            key :example, 1
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
    swagger_schema :GmPeriodDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :GmPeriodOutput
            end
          end
        end
      end
    end
  end
end
