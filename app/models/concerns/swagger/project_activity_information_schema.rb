module Swagger::ProjectActivityInformationSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ActivityEvaluationNotificationOutput do
      property :proposal_id do
        key :type, :integer
        key :format, :int64
      end
      property :proposal_title do
        key :type, :string
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
      property :project_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :project_type_name do
        key :type, :string
      end
      property :researcher_id do
        key :type, :integer
        key :format, :int64
      end
      property :identification_number do
        key :type, :string
      end
      property :oas_researcher_id do
        key :type, :string
      end
      property :role_id do
        key :type, :integer
        key :format, :int64
      end
      property :role_name do
        key :type, :string
      end
      property :total_notified_due_to_expire do
        key :type, :integer
        key :format, :int64
      end
      property :total_notified_expired do
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
        key :format, :'date-time'
      end
      property :updated_at do
        key :type, :string
        key :format, :'date-time'
      end
    end

    swagger_schema :ActivityEvaluationNotificationDx do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ActivityEvaluationNotificationOutput
            end
          end
        end
      end
    end

    swagger_schema :CompleteProjectActivityOutput do
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :name do
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
      property :proposal_id do
        key :type, :integer
        key :format, :int64
      end
      property :notified_due_to_expire do
        key :type, :boolean
      end
      property :notified_expired do
        key :type, :boolean
      end
      property :state_id do
        key :type, :integer
        key :format, :int64
      end
      property :state_name do
        key :type, :string
      end
      property :is_completed do
        key :type, :boolean
      end
    end

    swagger_schema :CompleteProjectActivityDx do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :CompleteProjectActivityOutput
            end
          end
        end
      end
    end

    swagger_schema :NotifiedActivityInput do
      property :notified_activity do
        property :notified_due_to_expire_ids do
          key :type, :array
          items do
            key :type, :integer
            key :format, :int64
          end
        end
        property :notified_expired_ids do
          key :type, :array
          items do
            key :type, :integer
            key :format, :int64
          end
        end
      end
    end

    swagger_schema :NotifiedActivityOutput do
      property :updated_activities do
        key :type, :array
        items do
          key :type, :integer
          key :format, :int64
        end
      end
    end
  end
end