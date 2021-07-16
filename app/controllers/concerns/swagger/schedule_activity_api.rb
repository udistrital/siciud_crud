module Swagger::ScheduleActivityApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/schedule_activities/{id}' do
      operation :get do
        key :summary, 'Get a Schedule Activity by ID'
        key :description, 'Returns a single Schedule Activity'
        key :operationId, :get_schedule_activity_by_id
        key :produces, ['application/json',]
        key :tags, ['Calls:: Schedule Activities']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Schedule Activity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'schedule activity response'
          schema do
            key :'$ref', :ScheduleActivityOutput
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
        key :summary, 'Update Schedule Activity by ID'
        key :description, 'Returns the updated Schedule Activity'
        key :operationId, :update_schedule_activity
        key :produces, ['application/json',]
        key :tags, ['Calls:: Schedule Activities']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Schedule Activity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :schedule_activity do
          key :in, :body
          key :description, 'Schedule Activity to update'
          key :required, true
          schema do
            key :'$ref', :ScheduleActivityInputPut
          end
        end

        response 200 do
          key :description, 'schedule activity response'
          schema do
            key :'$ref', :ScheduleActivityOutput
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
        key :summary, 'Activate or deactivate a Schedule Activity by ID'
        key :description, 'Returns the activated/deactivated Schedule Activity'
        key :operationId, :change_active_schedule_activity
        key :produces, ['application/json',]
        key :tags, ['Calls:: Schedule Activities']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Schedule Activity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :schedule_activity do
          key :in, :body
          key :description, 'Schedule Activity to activate or deactivate'
          key :required, true
          schema do
            property :schedule_activity do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'schedule activity response'
          schema do
            key :'$ref', :ScheduleActivityOutput
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

    swagger_path '/calls/{call_id}/schedule_activities' do
      operation :get do
        key :summary, 'Get all Schedule Activities'
        key :description, 'Returns all Schedule Activities'
        key :operationId, :get_schedule_activities
        key :produces, ['application/json',]
        key :tags, ['Calls:: Schedule Activities']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'schedule activity response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ScheduleActivityDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Schedule Activity'
        key :description, 'Returns the created Schedule Activity'
        key :operationId, :create_schedule_activity
        key :produces, ['application/json',]
        key :tags, ['Calls:: Schedule Activities']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :schedule_activity do
          key :in, :body
          key :description, 'Schedule Activity to register'
          key :required, true
          schema do
            key :'$ref', :ScheduleActivityInputPost
          end
        end

        response 201 do
          key :description, 'schedule activity response'
          schema do
            key :'$ref', :ScheduleActivityOutput
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