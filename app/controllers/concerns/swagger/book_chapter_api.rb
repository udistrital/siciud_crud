module Swagger::BookChapterApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_group/{research_group_id}/book_chapters/{id}' do
      operation :get do
        key :summary, 'Get a Book Chapter from a Research Unit by ID'
        key :description, 'Returns a single book chapter'
        key :operationId, :get_book_chapter_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Book Chapters']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of book chapter from a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'book chapter response'
          schema do
            key :'$ref', :BookChapterOutput
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
        key :summary, 'Update Book Chapter by ID'
        key :description, 'Returns the updated book chapter'
        key :operationId, :update_book_chapter
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Book Chapters']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of book chapter from a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :book_chapter do
          key :in, :body
          key :description, 'Book Chapter to update'
          key :required, true
          schema do
            key :'$ref', :BookChapterInput
          end
        end

        response 200 do
          key :description, 'book chapter response'
          schema do
            key :'$ref', :BookChapterOutput
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

    swagger_path '/research_group/{research_group_id}/book_chapters/' do
      operation :get do
        key :summary, 'Get all Book Chapters'
        key :description, 'Returns all book chapters'
        key :operationId, :get_book_chapters
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Book Chapters']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'book chapter response'
          schema do
            key :type, :array
            items do
              key :'$ref', :BookChapterOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Book Chapter'
        key :description, 'Returns the created book chapter'
        key :operationId, :create_book_chapter
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Book Chapters']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :book_chapter do
          key :in, :body
          key :description, 'Book Chapter to register'
          key :required, true
          schema do
            key :'$ref', :BookChapterInput
          end
        end

        response 201 do
          key :description, 'book chapter response'
          schema do
            key :'$ref', :BookChapterOutput
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