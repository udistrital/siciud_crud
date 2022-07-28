module Swagger::ActivityScheduleSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ActivitySchedule do
      property :name do
        key :type, :string
      end
      property :description do
        key :type, :string
      end
      property :start_date do
        key :type, :string
        key :format, :date
      end
      property :end_date do
        key :type, :string
        key :format, :date
      end
      property :duration do
        key :type, :integer
        key :format, :int64
      end
      property :deliverable do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ActivityScheduleInputPost do
      allOf do
        schema do
          property :activity_schedule do
            key :'$ref', :ActivitySchedule
          end
        end
        schema do
          property :activity_schedule do
            property :objective_ids do
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

    swagger_schema :ActivityScheduleInputPut do
      allOf do
        schema do
          property :activity_schedule do
            key :'$ref', :ActivitySchedule
          end
        end
        schema do
          property :activity_schedule do
            property :objective_ids do
              key :type, :array
              items do
                key :type, :integer
                key :format, :int64
              end
            end
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

    swagger_schema :ActivityScheduleBaseOutput do
      allOf do
        schema do
          key :'$ref', :ActivitySchedule
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

    swagger_schema :ActivityScheduleOutput do
      allOf do
        schema do
          key :'$ref', :ActivityScheduleBaseOutput
        end
        schema do
          property :objective_ids do
            key :type, :array
            items do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ActivityScheduleDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ActivityScheduleBaseOutput
            end
          end
        end
      end
    end
  end
end