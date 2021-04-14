module Swagger::OecdKnowledgeAreaApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/oecd_knowledge_areas/{id}' do
      operation :put do
        key :summary, 'Update OECD knowledge area by ID'
        key :description, 'Returns the updated OECD knowledge area'
        key :operationId, :update_oecd_knowledge_area
        key :produces, ['application/json',]
        key :tags, ['OECD - Organisation for Economic Co-operation and Development::Knowledge Areas']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of OECD knowledge areas to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :oecd_knowledge_area do
          key :in, :body
          key :description, 'OECD knowledge area to update'
          key :required, true
          schema do
            key :'$ref', :OecdKnowledgeAreaInput
          end
        end

        response 200 do
          key :description, 'OECD knowledge area response'
          schema do
            key :'$ref', :OecdKnowledgeAreaOutput
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

    swagger_path '/oecd_knowledge_areas/' do
      operation :get do
        key :summary, 'Get all OECD knowledge areas'
        key :description, 'Returns all OECD knowledge areas'
        key :operationId, :get_oecd_knowledge_areas
        key :produces, ['application/json',]
        key :tags, ['OECD - Organisation for Economic Co-operation and Development::Knowledge Areas']

        response 200 do
          key :description, 'OECD knowledge area response'
          schema do
            key :type, :array
            items do
              key :'$ref', :OecdKnowledgeAreaOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new OECD knowledge area'
        key :description, 'Returns the created broad area'
        key :operationId, :create_oecd_knowledge_area
        key :produces, ['application/json',]
        key :tags, ['OECD - Organisation for Economic Co-operation and Development::Knowledge Areas']

        parameter name: :oecd_knowledge_area do
          key :in, :body
          key :description, 'Broad Area to register'
          key :required, true
          schema do
            key :'$ref', :OecdKnowledgeAreaInput
          end
        end

        response 201 do
          key :description, 'OECD knowledge area response'
          schema do
            key :'$ref', :OecdKnowledgeAreaOutput
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