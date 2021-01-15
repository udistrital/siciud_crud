module Swagger::BookApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/api/v1/research_group/{research_group_id}/books/{id}' do
      operation :get do
        key :summary, 'Get a Book of a Research Unit by ID'
        key :description, 'Returns a single book'
        key :operationId, :get_book_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Books']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of book of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'book response'
          schema do
            key :'$ref', :BookOutput
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
        key :summary, 'Update Book by ID'
        key :description, 'Returns the updated book'
        key :operationId, :update_book
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Books']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of book of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :book do
          key :in, :body
          key :description, 'Book to update'
          key :required, true
          schema do
            key :'$ref', :BookInput
          end
        end

        response 200 do
          key :description, 'book response'
          schema do
            key :'$ref', :BookOutput
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

    swagger_path '/api/v1/research_group/{research_group_id}/books/' do
      operation :get do
        key :summary, 'Get all Books'
        key :description, 'Returns all books'
        key :operationId, :get_books
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Books']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'book response'
          schema do
            key :type, :array
            items do
              key :'$ref', :BookOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Book'
        key :description, 'Returns the created book'
        key :operationId, :create_book
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Books']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :book do
          key :in, :body
          key :description, 'Book to register'
          key :required, true
          schema do
            key :'$ref', :BookInput
          end
        end

        response 201 do
          key :description, 'book response'
          schema do
            key :'$ref', :BookOutput
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