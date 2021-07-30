module Swagger::CallsIndicatorApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/calls_indicators/{id}' do
      operation :get do
        key :summary, 'Get a calls indicator by ID'
        key :description, 'Returns a single calls indicator'
        key :operationId, :get_calls_indicator_by_id
        key :produces, ['application/json',]
        key :tags, ['Calls:: Calls Indicators']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of calls indicator to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'calls indicator response'
          schema do
            key :'$ref', :CallsIndicatorOutput
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
        key :summary, 'Update calls indicator by ID'
        key :description, 'Returns the updated calls indicator'
        key :operationId, :update_calls_indicator
        key :produces, ['application/json',]
        key :tags, ['Calls:: Calls Indicators']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of calls indicator to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :calls_indicator do
          key :in, :body
          key :description, 'calls indicator to update'
          key :required, true
          schema do
            key :'$ref', :CallsIndicatorInputPut
          end
        end

        response 200 do
          key :description, 'calls indicator response'
          schema do
            key :'$ref', :CallsIndicatorOutput
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
        key :summary, 'Activate or deactivate a calls indicator by ID'
        key :description, 'Returns the activated/deactivated calls indicator'
        key :operationId, :change_active_calls_indicator
        key :produces, ['application/json',]
        key :tags, ['Calls:: Calls Indicators']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of calls indicator to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :calls_indicator do
          key :in, :body
          key :description, 'calls indicator to activate or deactivate'
          key :required, true
          schema do
            property :calls_indicator do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'calls indicator response'
          schema do
            key :'$ref', :CallsIndicatorOutput
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

    swagger_path '/calls/{call_id}/calls_indicators' do
      operation :get do
        key :summary, 'Get all calls indicators'
        key :description, 'Returns all calls indicators'
        key :operationId, :get_calls_indicators
        key :produces, ['application/json',]
        key :tags, ['Calls:: Calls Indicators']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'calls indicator response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CallsIndicatorDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new calls indicators'
        key :description, 'Returns the created calls indicator'
        key :operationId, :create_calls_indicator
        key :produces, ['application/json',]
        key :tags, ['Calls:: Calls Indicators']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :calls_indicator do
          key :in, :body
          key :description, 'calls indicator to register'
          key :required, true
          schema do
            key :'$ref', :CallsIndicatorInputPost
          end
        end

        response 201 do
          key :description, 'calls indicator response'
          schema do
            key :'$ref', :CallsIndicatorOutput
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