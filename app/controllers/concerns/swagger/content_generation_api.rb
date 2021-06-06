module Swagger::ContentGenerationApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/content_generations/{id}' do
      operation :get do
        key :summary, 'Get a Content Generation by ID'
        key :description, 'Returns a single content generation'
        key :operationId, :get_content_generation_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Content Generations']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of content generation to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'content generation response'
          schema do
            key :'$ref', :ContentGenerationOutput
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
        key :summary, 'Update Content Generation by ID'
        key :description, 'Returns the updated content generation'
        key :operationId, :update_content_generation
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Content Generations']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of content generation to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :content_generation do
          key :in, :body
          key :description, 'Content Generation to update'
          key :required, true
          schema do
            key :'$ref', :ContentGenerationInputPut
          end
        end

        response 200 do
          key :description, 'content generation response'
          schema do
            key :'$ref', :ContentGenerationOutput
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
        key :summary, 'Activate or deactivate a Content Generation by ID'
        key :description, 'Returns the activated/deactivated content generation'
        key :operationId, :change_active_content_generation
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Content Generations']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of content generation to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :content_generation do
          key :in, :body
          key :description, 'Content Generation to activate or deactivate'
          key :required, true
          schema do
            property :content_generation do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'content generation response'
          schema do
            key :'$ref', :ContentGenerationOutput
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

    swagger_path '/research_units/{research_group_id}/content_generations' do
      operation :get do
        key :summary, 'Get all Content Generations'
        key :description, 'Returns all Content Generations'
        key :operationId, :get_content_generations
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Content Generations']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'content generation response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ContentGenerationDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Content Generations'
        key :description, 'Returns the created content generation'
        key :operationId, :create_content_generation
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Content Generations']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :content_generation do
          key :in, :body
          key :description, 'Content Generation to register'
          key :required, true
          schema do
            key :'$ref', :ContentGenerationInputPost
          end
        end

        response 201 do
          key :description, 'content generation response'
          schema do
            key :'$ref', :ContentGenerationOutput
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