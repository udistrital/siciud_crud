
module Swagger::SimpleBookApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/simple_books/{id}' do
      operation :get do
        key :summary, 'Get a Simple Book by ID'
        key :description, 'Returns a single simple book'
        key :operationId, :get_simple_book_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Simple Books']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of simple book to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'simple book response'
          schema do
            key :'$ref', :SimpleBookOutput
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
        key :summary, 'Update Simple Book by ID'
        key :description, 'Returns the updated simple book'
        key :operationId, :update_simple_book
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Simple Books']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of simple book to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :simple_book do
          key :in, :body
          key :description, 'Simple Book to update'
          key :required, true
          schema do
            key :'$ref', :SimpleBookInputPut
          end
        end

        response 200 do
          key :description, 'simple book response'
          schema do
            key :'$ref', :SimpleBookOutput
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
        key :summary, 'Activate or deactivate a Simple Book by ID'
        key :description, 'Returns the activated/deactivated simple book'
        key :operationId, :change_active_simple_book
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Simple Books']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of simple book to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :simple_book do
          key :in, :body
          key :description, 'Simple Book to activate or deactivate'
          key :required, true
          schema do
            property :simple_book do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'simple book response'
          schema do
            key :'$ref', :SimpleBookOutput
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

    swagger_path '/research_units/{research_group_id}/simple_books' do
      operation :get do
        key :summary, 'Get all Simple Books'
        key :description, 'Returns all simple books'
        key :operationId, :get_simple_books
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Simple Books']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :product_type_id do
          key :in, :query
          key :description, 'ID of type to fetch'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'simple book response'
          schema do
            key :type, :array
            items do
              key :'$ref', :SimpleBookDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Simple Books'
        key :description, 'Returns the created simple book'
        key :operationId, :create_simple_book
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Simple Books']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :simple_book do
          key :in, :body
          key :description, 'Simple Book to register'
          key :required, true
          schema do
            key :'$ref', :SimpleBookInputPost
          end
        end

        response 201 do
          key :description, 'simple book response'
          schema do
            key :'$ref', :SimpleBookOutput
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