module Swagger::EntityApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/entities/{id}' do
      operation :get do
        key :summary, 'Get a Entity by ID'
        key :description, 'Returns a single entity'
        key :operationId, :get_entity_by_id
        key :produces, ['application/json',]
        key :tags, ['Entities']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of entity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'entity response'
          schema do
            key :'$ref', :EntityOutput
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
        key :summary, 'Update Entity by ID'
        key :description, 'Returns the updated entity'
        key :operationId, :update_entity
        key :produces, ['application/json',]
        key :tags, ['Entities']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of entity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :entity do
          key :in, :body
          key :description, 'Entity to update'
          key :required, true
          schema do
            key :'$ref', :EntityInputPut
          end
        end

        response 200 do
          key :description, 'entity response'
          schema do
            key :'$ref', :EntityOutput
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
        key :summary, 'Activate or deactivate a Entity by ID'
        key :description, 'Returns the activated/deactivated entity'
        key :operationId, :change_active_entity
        key :produces, ['application/json',]
        key :tags, ['Entities']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of entity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :entity do
          key :in, :body
          key :description, 'Entity to activate or deactivate'
          key :required, true
          schema do
            property :entity do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'entity response'
          schema do
            key :'$ref', :EntityOutput
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

    swagger_path '/entities' do
      operation :get do
        key :summary, 'Get all entities'
        key :description, 'Returns all entities'
        key :operationId, :get_entities
        key :produces, ['application/json',]
        key :tags, ['Entities']

        response 200 do
          key :description, 'entity response'
          schema do
            key :type, :array
            items do
              key :'$ref', :EntityDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Entity'
        key :description, 'Returns the created entity'
        key :operationId, :create_entity
        key :produces, ['application/json',]
        key :tags, ['Entities']

        parameter name: :entity do
          key :in, :body
          key :description, 'Entity to register'
          key :required, true
          schema do
            key :'$ref', :EntityInputPost
          end
        end

        response 201 do
          key :description, 'entity response'
          schema do
            key :'$ref', :EntityOutput
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