module Swagger::ScheduleActivitySchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ScheduleActivity do
      property :sa_order do
        key :type, :integer
        key :format, :int64
      end
      property :sa_description do
        key :type, :string
      end
      property :sa_date do
        key :type, :string
      end
      property :sa_start_date do
        key :type, :string
        key :format, :date
        key :example, '2021-10-28'
      end
      property :sa_end_date do
        key :type, :string
        key :format, :date
        key :example, '2021-02-21'
      end
      property :sa_responsible do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ScheduleActivityInputPost do
      allOf do
        schema do
          property :schedule_activity do
            key :'$ref', :ScheduleActivity
          end
        end
        schema do
          property :schedule_activity do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ScheduleActivityInputPut do
      allOf do
        schema do
          property :schedule_activity do
            key :'$ref', :ScheduleActivity
          end
        end
        schema do
          property :schedule_activity do
            property :call_id do
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

    swagger_schema :ScheduleActivityOutput do
      allOf do
        schema do
          key :'$ref', :ScheduleActivity
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

    swagger_schema :ScheduleActivityDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ScheduleActivityOutput
            end
          end
        end
      end
    end
  end
end