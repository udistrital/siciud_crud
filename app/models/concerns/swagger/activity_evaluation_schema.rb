module Swagger::ActivityEvaluationSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ActivityEvaluation do
      property :state_id do
        key :type, :integer
        key :format, :int64
      end
      property :notified_due_to_expire do
        key :type, :boolean
        key :default, true
      end
      property :notified_expired do
        key :type, :boolean
        key :default, true
      end
      property :is_completed do
        key :type, :boolean
        key :default, true
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ActivityEvaluationInputPost do
      allOf do
        schema do
          property :activity_evaluation do
            key :'$ref', :ActivityEvaluation
          end
        end
        schema do
          property :activity_evaluation do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ActivityEvaluationInputPut do
      allOf do
        schema do
          property :activity_evaluation do
            key :'$ref', :ActivityEvaluation
          end
        end
        schema do
          property :activity_evaluation do
            property :activity_schedule_id do
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

    swagger_schema :ActivityEvaluationBaseOutput do
      allOf do
        schema do
          key :'$ref', :ActivityEvaluation
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :activity_schedule_id do
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

    swagger_schema :ActivityEvaluationOutput do
      allOf do
        schema do
          key :'$ref', :ActivityEvaluationBaseOutput
        end
        schema do
          property :activity_schedule do
            key :'$ref', :ActivityEvaluationBaseOutput
          end
        end
      end
    end

    swagger_schema :ActivityEvaluationComplete do
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :activity_schedule_id do
        key :type, :integer
        key :format, :int64
      end
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
      property :proposal_id do
        key :type, :integer
        key :format, :int64
      end
      property :objective_ids do
        key :type, :array
        items do
          key :type, :integer
          key :format, :int64
        end
      end
      property :activity_schedule_active do
        key :type, :boolean
        key :default, true
      end
      property :activity_schedule_created_by do
        key :type, :integer
        key :format, :int64
      end
      property :activity_schedule_updated_by do
        key :type, :integer
        key :format, :int64
      end
      property :activity_schedule_created_at do
        key :type, :string
        key :format, 'date-time'
      end
      property :activity_schedule_updated_at do
        key :type, :string
        key :format, 'date-time'
      end
      property :notified_due_to_expire do
        key :type, :boolean
        key :default, true
      end
      property :notified_expired do
        key :type, :boolean
        key :default, true
      end
      property :is_completed do
        key :type, :boolean
        key :default, true
      end
      property :state_id do
        key :type, :integer
        key :format, :int64
      end
      property :state_name do
        key :type, :string
      end
      property :activity_evaluation_active do
        key :type, :boolean
        key :default, true
      end
      property :activity_evaluation_created_by do
        key :type, :integer
        key :format, :int64
      end
      property :activity_evaluation_updated_by do
        key :type, :integer
        key :format, :int64
      end
      property :activity_evaluation_created_at do
        key :type, :string
        key :format, 'date-time'
      end
      property :activity_evaluation_updated_at do
        key :type, :string
        key :format, 'date-time'
      end
    end

    swagger_schema :ActivityEvaluationDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ActivityEvaluationComplete
            end
          end
        end
      end
    end
  end
end