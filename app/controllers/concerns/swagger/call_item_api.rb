module Swagger::CallItemApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/call_items/{id}' do
      operation :get do
        key :summary, 'Get a Call Item by ID'
        key :description, 'Returns a single call item'
        key :operationId, :get_call_item_by_id
        key :produces, ['application/json',]
        key :tags, ['Call Items']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of call item to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'call item response'
          schema do
            key :'$ref', :CallItemOutput
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
        key :summary, 'Update call item by ID'
        key :description, 'Returns the updated call item'
        key :operationId, :update_call_item
        key :produces, ['application/json',]
        key :tags, ['Call Items']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of call item to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call_item do
          key :in, :body
          key :description, 'call item to update'
          key :required, true
          schema do
            key :'$ref', :CallItemInputPut
          end
        end

        response 200 do
          key :description, 'call item response'
          schema do
            key :'$ref', :CallItemOutput
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
        key :summary, 'Activate or deactivate a call item by ID'
        key :description, 'Returns the activated/deactivated call item'
        key :operationId, :change_active_call_item
        key :produces, ['application/json',]
        key :tags, ['Call Items']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of call item to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call_item do
          key :in, :body
          key :description, 'call item to activate or deactivate'
          key :required, true
          schema do
            property :call_item do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'call item response'
          schema do
            key :'$ref', :CallItemOutput
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

    swagger_path '/calls/{call_id}/call_items' do
      operation :get do
        key :summary, 'Get all call items'
        key :description, 'Returns all call items'
        key :operationId, :get_call_items
        key :produces, ['application/json',]
        key :tags, ['Call Items']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'call item response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CallItemDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new call item'
        key :description, 'Returns the created call item'
        key :operationId, :create_call_item
        key :produces, ['application/json',]
        key :tags, ['Call Items']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call_item do
          key :in, :body
          key :description, 'call item to register'
          key :required, true
          schema do
            key :'$ref', :CallItemInputPost
          end
        end

        response 201 do
          key :description, 'call item response'
          schema do
            key :'$ref', :CallItemOutput
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