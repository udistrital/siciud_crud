module Swagger::KeywordApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/keywords/{id}' do
      operation :get do
        key :summary, 'Get a Keyword by ID'
        key :description, 'Returns a single keyword'
        key :operationId, :get_keyword_by_id
        key :produces, ['application/json',]
        key :tags, ['Keywords']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of keyword to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'keyword response'
          schema do
            key :'$ref', :KeywordOutput
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
        key :summary, 'Update Keyword by ID'
        key :description, 'Returns the updated keyword'
        key :operationId, :update_keyword
        key :produces, ['application/json',]
        key :tags, ['Keywords']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of keyword to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :keyword do
          key :in, :body
          key :description, 'Keyword to update'
          key :required, true
          schema do
            key :'$ref', :KeywordInputPut
          end
        end

        response 200 do
          key :description, 'keyword response'
          schema do
            key :'$ref', :KeywordOutput
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
        key :summary, 'Activate or deactivate a keyword by ID'
        key :description, 'Returns the activated/deactivated keyword'
        key :operationId, :change_active_keyword
        key :produces, ['application/json',]
        key :tags, ['Keywords']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of keyword to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :keyword do
          key :in, :body
          key :description, 'keyword to activate or deactivate'
          key :required, true
          schema do
            property :keyword do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'keyword response'
          schema do
            key :'$ref', :KeywordOutput
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

    swagger_path '/keywords' do
      operation :get do
        key :summary, 'Get all Keywords'
        key :description, 'Returns all keywords'
        key :operationId, :get_keywords
        key :produces, ['application/json',]
        key :tags, ['Keywords']

        response 200 do
          key :description, 'keyword response'
          schema do
            key :'$ref', :KeywordDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Keyword'
        key :description, 'Returns the created keyword'
        key :operationId, :create_keyword
        key :produces, ['application/json',]
        key :tags, ['Keywords']

        parameter name: :keyword do
          key :in, :body
          key :description, 'Keyword to register'
          key :required, true
          schema do
            key :'$ref', :KeywordInputPost
          end
        end

        response 201 do
          key :description, 'keyword response'
          schema do
            key :'$ref', :KeywordOutput
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