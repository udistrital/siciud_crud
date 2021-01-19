module Swagger::OecdKnowledgeSubareaApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/oecd_knowledge_subareas/{id}' do
      operation :put do
        key :summary, 'Update OECD knowledge subarea by ID'
        key :description, 'Returns the updated OECD knowledge subarea'
        key :operationId, :update_oecd_knowledge_subarea
        key :produces, ['application/json',]
        key :tags, ['OECD - Organisation for Economic Co-operation and Development::Knowledge Subareas']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of OECD knowledge subarea to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :oecd_knowledge_subarea do
          key :in, :body
          key :description, 'OECD knowledge subarea to update'
          key :required, true
          schema do
            key :'$ref', :OecdKnowledgeSubareaInput
          end
        end

        response 200 do
          key :description, 'OECD knowledge subarea response'
          schema do
            key :'$ref', :OecdKnowledgeSubareaOutput
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

    swagger_path '/oecd_knowledge_subareas/' do
      operation :get do
        key :summary, 'Get all OECD knowledge subareas'
        key :description, 'Returns all OECD knowledge subareas'
        key :operationId, :get_oecd_knowledge_subareas
        key :produces, ['application/json',]
        key :tags, ['OECD - Organisation for Economic Co-operation and Development::Knowledge Subareas']

        response 200 do
          key :description, 'OECD knowledge subarea response'
          schema do
            key :type, :array
            items do
              key :'$ref', :OecdKnowledgeSubareaOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new OECD knowledge subarea'
        key :description, 'Returns the created broad area'
        key :operationId, :create_oecd_knowledge_subarea
        key :produces, ['application/json',]
        key :tags, ['OECD - Organisation for Economic Co-operation and Development::Knowledge Subareas']

        parameter name: :oecd_knowledge_subarea do
          key :in, :body
          key :description, 'Broad Area to register'
          key :required, true
          schema do
            key :'$ref', :OecdKnowledgeSubareaInput
          end
        end

        response 201 do
          key :description, 'OECD knowledge subarea response'
          schema do
            key :'$ref', :OecdKnowledgeSubareaOutput
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