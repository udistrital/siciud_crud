module Swagger::ResearchUnitApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_units/{id}' do
      operation :get do
        key :summary, 'Get a Research Unit by ID'
        key :description, 'Returns a single research unit'
        key :operationId, :get_research_unit_by_id
        key :produces, ['application/json',]
        key :tags, ['Research Units']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'research unit response'
          schema do
            key :'$ref', :ResearchUnitOutput
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
        key :summary, 'Update Research Unit by ID'
        key :description, 'Returns the updated research unit'
        key :operationId, :update_research_unit
        key :produces, ['application/json',]
        key :tags, ['Research Units']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :research_group do
          key :in, :body
          key :description, 'Research Unit to update'
          key :required, true
          schema do
            key :'$ref', :ResearchUnitInput
          end
        end

        response 200 do
          key :description, 'research unit response'
          schema do
            key :'$ref', :ResearchUnitOutput
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

    swagger_path '/research_units/' do
      operation :get do
        key :summary, 'Get all Research Units'
        key :description, 'Returns all Research Units'
        key :operationId, :get_research_units
        key :produces, ['application/json',]
        key :tags, ['Research Units']

        response 200 do
          key :description, 'research unit response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ResearchUnitDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Research Unit'
        key :description, 'Returns the created research unit'
        key :operationId, :create_research_unit
        key :produces, ['application/json',]
        key :tags, ['Research Units']

        parameter name: :research_group do
          key :in, :body
          key :description, 'Research Unit to register'
          key :required, true
          schema do
            key :'$ref', :ResearchUnitInputPost
          end
        end

        response 201 do
          key :description, 'research unit response'
          schema do
            key :'$ref', :ResearchUnitOutput
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