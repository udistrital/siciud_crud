module Swagger::ScientificCollectionApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/scientific_collections/{id}' do
      operation :get do
        key :summary, 'Get a Scientific Collection by ID'
        key :description, 'Returns a single Scientific Collection'
        key :operationId, :get_scientific_collection_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Scientific Collections']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Scientific Collection to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'scientific collection response'
          schema do
            key :'$ref', :ScientificCollectionOutput
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
        key :summary, 'Update a Scientific Collection by ID'
        key :description, 'Returns the updated Scientific Collection'
        key :operationId, :update_scientific_collection
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Scientific Collections']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Scientific Collection to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :scientific_collection do
          key :in, :body
          key :description, 'Scientific Collection to update'
          key :required, true
          schema do
            key :'$ref', :ScientificCollectionInputPut
          end
        end

        response 200 do
          key :description, 'scientific collection response'
          schema do
            key :'$ref', :ScientificCollectionOutput
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
        key :summary, 'Activate or deactivate a Scientific Collection by ID'
        key :description, 'Returns the activated/deactivated Scientific Collection'
        key :operationId, :change_active_scientific_collection
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Scientific Collections']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Scientific Collection to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :scientific_collection do
          key :in, :body
          key :description, 'Scientific Collection to update'
          key :required, true
          schema do
            property :scientific_collection do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'scientific collection response'
          schema do
            key :'$ref', :ScientificCollectionOutput
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

    swagger_path '/research_units/{research_group_id}/scientific_collections/' do
      operation :get do
        key :summary, 'Get all Scientific Collections'
        key :description, 'Returns all Scientific Collections'
        key :operationId, :get_scientific_collections
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Scientific Collections']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Scientific Collection response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ScientificCollectionDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Scientific Collections'
        key :description, 'Returns the created Scientific Collection'
        key :operationId, :create_scientific_collection
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Scientific Collections']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :scientific_collection do
          key :in, :body
          key :description, 'Scientific Collection to register'
          key :required, true
          schema do
            key :'$ref', :ScientificCollectionInputPost
          end
        end

        response 201 do
          key :description, 'scientific collection response'
          schema do
            key :'$ref', :ScientificCollectionOutput
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