module Swagger::SniesApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/snies/{id}' do
      operation :get do
        key :summary, 'Get a Snies by ID'
        key :description, 'Returns a single snies'
        key :operationId, :get_snies_by_id
        key :produces, ['application/json',]
        key :tags, ['Snies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of snies to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'snies response'
          schema do
            key :'$ref', :SniesOutput
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
        key :summary, 'Update Snies by ID'
        key :description, 'Returns the updated snies'
        key :operationId, :update_snies
        key :produces, ['application/json',]
        key :tags, ['Snies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of snies to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :snies do
          key :in, :body
          key :description, 'Snies to update'
          key :required, true
          schema do
            key :'$ref', :SniesInputPut
          end
        end

        response 200 do
          key :description, 'snies response'
          schema do
            key :'$ref', :SniesOutput
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
        key :summary, 'Activate or deactivate a Snies by ID'
        key :description, 'Returns the activated/deactivated snies'
        key :operationId, :change_active_snies
        key :produces, ['application/json',]
        key :tags, ['Snies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of snies to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :snies do
          key :in, :body
          key :description, 'Snies to activate or deactivate'
          key :required, true
          schema do
            property :snies do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'snies response'
          schema do
            key :'$ref', :SniesOutput
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

    swagger_path '/snies' do
      operation :get do
        key :summary, 'Get all Sniess'
        key :description, 'Returns all sniess'
        key :operationId, :get_snies
        key :produces, ['application/json',]
        key :tags, ['Snies']

        response 200 do
          key :description, 'snies response'
          schema do
            key :type, :array
            items do
              key :'$ref', :SniesDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Snies'
        key :description, 'Returns the created snies'
        key :operationId, :create_snies
        key :produces, ['application/json',]
        key :tags, ['Snies']

        parameter name: :snies do
          key :in, :body
          key :description, 'Snies to register'
          key :required, true
          schema do
            key :'$ref', :SniesInputPost
          end
        end

        response 201 do
          key :description, 'snies response'
          schema do
            key :'$ref', :SniesOutput
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