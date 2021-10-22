module Swagger::DependencyApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/dependencies/{id}' do
      operation :get do
        key :summary, 'Get a Dependency by ID'
        key :description, 'Returns a single dependency'
        key :operationId, :get_dependency_by_id
        key :produces, ['application/json',]
        key :tags, ['Entities::Dependencies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of dependency to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'dependency response'
          schema do
            key :'$ref', :DependencyOutput
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
        key :summary, 'Update Dependency by ID'
        key :description, 'Returns the updated dependency'
        key :operationId, :update_dependency
        key :produces, ['application/json',]
        key :tags, ['Entities::Dependencies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of dependency to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :dependency do
          key :in, :body
          key :description, 'Dependency to update'
          key :required, true
          schema do
            key :'$ref', :DependencyInputPut
          end
        end

        response 200 do
          key :description, 'dependency response'
          schema do
            key :'$ref', :DependencyOutput
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
        key :summary, 'Activate or deactivate a Dependency by ID'
        key :description, 'Returns the activated/deactivated dependency'
        key :operationId, :change_active_dependency
        key :produces, ['application/json',]
        key :tags, ['Entities::Dependencies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of dependency to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :dependency do
          key :in, :body
          key :description, 'Dependency to activate or deactivate'
          key :required, true
          schema do
            property :dependency do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'dependency response'
          schema do
            key :'$ref', :DependencyOutput
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

    swagger_path '/entities/{entity_id}/dependencies' do
      operation :get do
        key :summary, 'Get all Dependencies'
        key :description, 'Returns all dependencies'
        key :operationId, :get_dependencies
        key :produces, ['application/json',]
        key :tags, ['Entities::Dependencies']

        parameter name: :entity_id do
          key :in, :path
          key :description, 'ID of entity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'dependency response'
          schema do
            key :type, :array
            items do
              key :'$ref', :DependencyDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Dependency'
        key :description, 'Returns the created dependency'
        key :operationId, :create_dependency
        key :produces, ['application/json',]
        key :tags, ['Entities::Dependencies']

        parameter name: :entity_id do
          key :in, :path
          key :description, 'ID of entity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :dependency do
          key :in, :body
          key :description, 'Dependency to register'
          key :required, true
          schema do
            key :'$ref', :DependencyInputPost
          end
        end

        response 201 do
          key :description, 'dependency response'
          schema do
            key :'$ref', :DependencyOutput
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