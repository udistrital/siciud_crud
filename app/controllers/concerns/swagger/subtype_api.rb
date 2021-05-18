module Swagger::SubtypeApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/subtypes/{id}' do
      operation :get do
        key :summary, 'Get a subypes by id'
        key :description, 'Returns a single subtype'
        key :operationId, :get_subtype_by_id
        key :produces, ['application/json',]
        key :tags, ['Subtypes']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of subtype to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'subtype response'
          schema do
            key :'$ref', :SubtypeOutput
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
        key :summary, 'Update subtype by id'
        key :description, 'Returns the updated subtype'
        key :operationId, :update_subtype
        key :produces, ['application/json',]
        key :tags, ['Subtypes']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of subtype to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :subtype do
          key :in, :body
          key :description, 'Subtype to update'
          key :required, true
          schema do
            key :'$ref', :SubtypeInputPut
          end
        end

        response 200 do
          key :description, 'subtype response'
          schema do
            key :'$ref', :SubtypeOutput
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

    swagger_path '/subtypes' do
      operation :get do
        key :summary, 'Get all subtypes'
        key :description, 'Returns all subtypes'
        key :operationId, :get_subtypes
        key :produces, ['application/json',]
        key :tags, ['Subtypes']

        response 200 do
          key :description, 'subtype response'
          schema do
            key :type, :array
            items do
              key :'$ref', :SubtypeOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Subtype'
        key :description, 'Returns the created subtype'
        key :operationId, :create_subtype
        key :produces, ['application/json',]
        key :tags, ['Subtypes']

        parameter name: :subtype do
          key :in, :body
          key :description, 'Subtype to register'
          key :required, true
          schema do
            key :'$ref', :SubtypeInputPost
          end
        end

        response 201 do
          key :description, 'subtype response'
          schema do
            key :'$ref', :SubtypeOutput
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

    swagger_path '/subtypes/by-type/{type_id}' do
      operation :get do
        key :summary, 'Get all subtypes of a type by id'
        key :description, 'Returns all subtype of a type by id'
        key :operationId, :get_subtypes_by_type
        key :produces, ['application/json',]
        key :tags, ['Subtypes']

        parameter name: :type_id do
          key :in, :path
          key :description, 'ID of type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'subtype response'
          schema do
            key :type, :array
            items do
              key :'$ref', :SubtypeOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end
  end
end
