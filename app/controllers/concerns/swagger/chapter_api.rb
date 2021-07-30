module Swagger::ChapterApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  CHAPTER_CONTEXT_ARRAY = [:calls]
  included do
    swagger_path '/{chapter_context}/{chapter_context_id}/chapters/{id}' do
      operation :get do
        key :summary, 'Get a chapter by ID'
        key :description, 'Returns a single chapter'
        key :operationId, :get_chapter_by_id
        key :produces, ['application/json',]
        key :tags, ['Chapters']

        parameter name: :chapter_context do
          key :in, :path
          key :description, 'Resource that require chapters or sections, for example, to build a document.'
          key :enum, CHAPTER_CONTEXT_ARRAY
          key :required, true
          key :type, :string
        end

        parameter name: :chapter_context_id do
          key :in, :path
          key :description, 'Resource ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of chapter to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'chapter response'
          schema do
            key :'$ref', :ChapterOutput
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
        key :summary, 'Update chapter by ID'
        key :description, 'Returns the updated chapter'
        key :operationId, :update_chapter
        key :produces, ['application/json',]
        key :tags, ['Chapters']

        parameter name: :chapter_context do
          key :in, :path
          key :description, 'Resource that require chapters or sections, for example, to build a document.'
          key :enum, CHAPTER_CONTEXT_ARRAY
          key :required, true
          key :type, :string
        end

        parameter name: :chapter_context_id do
          key :in, :path
          key :description, 'Resource ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of chapter to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :chapter do
          key :in, :body
          key :description, 'chapter to update'
          key :required, true
          schema do
            key :'$ref', :ChapterInputPut
          end
        end

        response 200 do
          key :description, 'chapter response'
          schema do
            key :'$ref', :ChapterOutput
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
        key :summary, 'Activate or deactivate a chapter by ID'
        key :description, 'Returns the activated/deactivated chapter'
        key :operationId, :change_active_chapter
        key :produces, ['application/json',]
        key :tags, ['Chapters']

        parameter name: :chapter_context do
          key :in, :path
          key :description, 'Resource that require chapters or sections, for example, to build a document.'
          key :enum, CHAPTER_CONTEXT_ARRAY
          key :required, true
          key :type, :string
        end

        parameter name: :chapter_context_id do
          key :in, :path
          key :description, 'Resource ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of chapter to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :chapter do
          key :in, :body
          key :description, 'chapter to activate or deactivate'
          key :required, true
          schema do
            property :chapter do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'chapter response'
          schema do
            key :'$ref', :ChapterOutput
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

    swagger_path '/{chapter_context}/{chapter_context_id}/chapters' do
      operation :get do
        key :summary, 'Get all chapters'
        key :description, 'Returns all chapters'
        key :operationId, :get_chapters
        key :produces, ['application/json',]
        key :tags, ['Chapters']

        parameter name: :chapter_context do
          key :in, :path
          key :description, 'Resource that require chapters or sections, for example, to build a document.'
          key :enum, CHAPTER_CONTEXT_ARRAY
          key :required, true
          key :type, :string
        end

        parameter name: :chapter_context_id do
          key :in, :path
          key :description, 'Resource ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'chapter response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ChapterDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new chapter'
        key :description, 'Returns the created chapter'
        key :operationId, :create_chapter
        key :produces, ['application/json',]
        key :tags, ['Chapters']

        parameter name: :chapter_context do
          key :in, :path
          key :description, 'Resource that require chapters or sections, for example, to build a document.'
          key :enum, CHAPTER_CONTEXT_ARRAY
          key :required, true
          key :type, :string
        end

        parameter name: :chapter_context_id do
          key :in, :path
          key :description, 'Resource ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :chapter do
          key :in, :body
          key :description, 'chapter to register'
          key :required, true
          schema do
            key :'$ref', :ChapterInputPost
          end
        end

        response 201 do
          key :description, 'chapter response'
          schema do
            key :'$ref', :ChapterOutput
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