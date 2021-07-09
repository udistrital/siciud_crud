module Swagger::CallApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/calls/{id}' do
      operation :get do
        key :summary, 'Get a Call by ID'
        key :description, 'Returns a single call'
        key :operationId, :get_call_by_id
        key :produces, ['application/json',]
        key :tags, ['Calls']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'call response'
          schema do
            key :'$ref', :CallOutput
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
        key :summary, 'Update Call by ID'
        key :description, 'Returns the updated call'
        key :operationId, :update_call
        key :produces, ['application/json',]
        key :tags, ['Calls']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call do
          key :in, :body
          key :description, 'call to update'
          key :required, true
          schema do
            key :'$ref', :CallInputPut
          end
        end

        response 200 do
          key :description, 'call response'
          schema do
            key :'$ref', :CallOutput
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
        key :summary, 'Activate or deactivate a Call by ID'
        key :description, 'Returns the activated/deactivated call'
        key :operationId, :change_active_call
        key :produces, ['application/json',]
        key :tags, ['Calls']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call do
          key :in, :body
          key :description, 'call to activate or deactivate'
          key :required, true
          schema do
            property :call do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'call response'
          schema do
            key :'$ref', :CallOutput
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

    swagger_path '/calls' do
      operation :get do
        key :summary, 'Get all Calls'
        key :description, 'Returns all calls'
        key :operationId, :get_calls
        key :produces, ['application/json',]
        key :tags, ['Calls']

        response 200 do
          key :description, 'call response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CallDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Calls'
        key :description, 'Returns the created call'
        key :operationId, :create_call
        key :produces, ['application/json',]
        key :tags, ['Calls']

        parameter name: :call do
          key :in, :body
          key :description, 'call to register'
          key :required, true
          schema do
            key :'$ref', :CallInputPost
          end
        end

        response 201 do
          key :description, 'call response'
          schema do
            key :'$ref', :CallOutput
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