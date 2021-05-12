module Swagger::KnowledgeNetworkApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/knowledge_networks/{id}' do
      operation :get do
        key :summary, 'Get a Knowledge Network by ID'
        key :description, 'Returns a single Knowledge Network'
        key :operationId, :get_knowledge_network_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Knowledge Networks']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Knowledge Network to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'knowledge network response'
          schema do
            key :'$ref', :KnowledgeNetworkOutput
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
        key :summary, 'Update Knowledge Network by ID'
        key :description, 'Returns the updated Knowledge Network'
        key :operationId, :update_knowledge_network
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Knowledge Networks']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Knowledge Network to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :knowledge_network do
          key :in, :body
          key :description, 'Knowledge Network to update'
          key :required, true
          schema do
            key :'$ref', :KnowledgeNetworkInputPut
          end
        end

        response 200 do
          key :description, 'knowledge network response'
          schema do
            key :'$ref', :KnowledgeNetworkOutput
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
        key :summary, 'Activate or deactivate a Knowledge Network by ID'
        key :description, 'Returns the activated/deactivated Knowledge Network'
        key :operationId, :change_active_knowledge_network
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Knowledge Networks']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Knowledge Network to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :knowledge_network do
          key :in, :body
          key :description, 'Knowledge Network to activate or deactivate'
          key :required, true
          schema do
            property :knowledge_network do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'knowledge network response'
          schema do
            key :'$ref', :KnowledgeNetworkOutput
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

    swagger_path '/research_units/{research_group_id}/knowledge_networks/' do
      operation :get do
        key :summary, 'Get all Knowledge Networks'
        key :description, 'Returns all Knowledge Networks'
        key :operationId, :get_knowledge_networks
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Knowledge Networks']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'knowledge network response'
          schema do
            key :type, :array
            items do
              key :'$ref', :KnowledgeNetworkDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Knowledge Networks'
        key :description, 'Returns the created Knowledge Network'
        key :operationId, :create_knowledge_network
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Knowledge Networks']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :knowledge_network do
          key :in, :body
          key :description, 'Knowledge Network to register'
          key :required, true
          schema do
            key :'$ref', :KnowledgeNetworkInputPost
          end
        end

        response 201 do
          key :description, 'knowledge network response'
          schema do
            key :'$ref', :KnowledgeNetworkOutput
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