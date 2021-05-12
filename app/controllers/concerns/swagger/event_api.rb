module Swagger::EventApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_units/{research_group_id}/events/{id}' do
      operation :get do
        key :summary, 'Get a Event of a Research Unit by ID'
        key :description, 'Returns a single event'
        key :operationId, :get_event_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Events']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of event of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'event response'
          schema do
            key :'$ref', :EventOutput
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
        key :summary, 'Update event by ID'
        key :description, 'Returns the updated event'
        key :operationId, :update_event
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Events']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of event of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :event do
          key :in, :body
          key :description, 'event to update'
          key :required, true
          schema do
            key :'$ref', :EventInputPut
          end
        end

        response 200 do
          key :description, 'event response'
          schema do
            key :'$ref', :EventOutput
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

    swagger_path '/research_units/{research_group_id}/events/' do
      operation :get do
        key :summary, 'Get all events'
        key :description, 'Returns all events'
        key :operationId, :get_events
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Events']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :eve_type_id do
          key :in, :query
          key :description, 'ID of type to fetch'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'event response'
          schema do
            key :type, :array
            items do
              key :'$ref', :EventDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new event'
        key :description, 'Returns the created event'
        key :operationId, :create_event
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Events']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :event do
          key :in, :body
          key :description, 'event to register'
          key :required, true
          schema do
            key :'$ref', :EventInputPost
          end
        end

        response 201 do
          key :description, 'event response'
          schema do
            key :'$ref', :EventOutput
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

    swagger_path '/research_units/{research_group_id}/events/{id}/active' do
      operation :put do
        key :summary, 'Activate or deactivate a event by ID'
        key :description, 'Returns the activated/deactivated event'
        key :operationId, :change_active_event
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Events']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of event of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :event do
          key :in, :body
          key :description, 'event to activate/deactivate'
          key :required, true
          schema do
            property :event do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'event response'
          schema do
            key :'$ref', :eventOutput
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