module Swagger::ActivityScheduleApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/activity_schedules/{id}' do
      operation :get do
        key :summary, 'Get an activity schedule by ID'
        key :description, 'Returns a single activity schedule'
        key :operationId, :get_activity_schedule_by_id
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Activity Schedules']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of activity schedule to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'activity schedule response'
          schema do
            key :'$ref', :ActivityScheduleOutput
          end
        end
        response 404 do
          key :description, 'Not Found'
          schema do
            key :'$ref', :ErrorNotFound
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :put do
        key :summary, 'Update activity schedule by ID'
        key :description, 'Returns the updated activity schedule'
        key :operationId, :update_activity_schedule
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Activity Schedules']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of activity schedule to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :activity_schedule do
          key :in, :body
          key :description, 'Activity schedule to update'
          key :required, true
          schema do
            key :'$ref', :ActivityScheduleInputPut
          end
        end

        response 200 do
          key :description, 'activity schedule response'
          schema do
            key :'$ref', :ActivityScheduleOutput
          end
        end
        response 422 do
          key :description, 'Unprocessable Entity'
          schema do
            key :'$ref', :ErrorUnprocessableEntity
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :patch do
        key :summary, 'Activate or deactivate an activity schedule by ID'
        key :description, 'Returns the activated/deactivated activity schedule'
        key :operationId, :change_active_activity_schedule
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Activity Schedules']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of activity schedule to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :activity_schedule do
          key :in, :body
          key :description, 'Activity schedule to activate or deactivate'
          key :required, true
          schema do
            property :activity_schedule do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'activity schedule response'
          schema do
            key :'$ref', :ActivityScheduleOutput
          end
        end
        response 422 do
          key :description, 'Unprocessable Entity'
          schema do
            key :'$ref', :ErrorUnprocessableEntity
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end

    swagger_path '/proposals/{proposal_id}/activity_schedules' do
      operation :get do
        key :summary, 'Get all activity schedules'
        key :description, 'Returns all activity schedules'
        key :operationId, :get_activity_schedules
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Activity Schedules']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'activity schedule response'
          schema do
            key :'$ref', :ActivityScheduleDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new activity schedule'
        key :description, 'Returns the created activity schedule'
        key :operationId, :create_activity_schedule
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Activity Schedules']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :activity_schedule do
          key :in, :body
          key :description, 'ActivitySchedule to register'
          key :required, true
          schema do
            key :'$ref', :ActivityScheduleInputPost
          end
        end

        response 201 do
          key :description, 'activity schedule response'
          schema do
            key :'$ref', :ActivityScheduleOutput
          end
        end
        response 422 do
          key :description, 'Unprocessable Entity'
          schema do
            key :'$ref', :ErrorUnprocessableEntity
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end
  end
end