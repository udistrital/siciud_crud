module Swagger::ResearchNetworkApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_networks/{id}' do
      operation :get do
        key :summary, 'Get a Research network by ID'
        key :description, 'Returns a single research network'
        key :operationId, :get_research_network_by_id
        key :produces, ['application/json',]
        key :tags, ['Research Networks']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research network to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'research network response'
          schema do
            key :'$ref', :ResearchNetworkOutput
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
        key :summary, 'Update Research network by ID'
        key :description, 'Returns the updated research network'
        key :operationId, :update_research_network
        key :produces, ['application/json',]
        key :tags, ['Research Networks']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research network to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :research_network do
          key :in, :body
          key :description, 'Research network to update'
          key :required, true
          schema do
            key :'$ref', :ResearchNetworkInputPut
          end
        end

        response 200 do
          key :description, 'research network response'
          schema do
            key :'$ref', :ResearchNetworkOutput
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
        key :summary, 'Activate or deactivate a Research network by ID'
        key :description, 'Returns the activated/deactivated research network'
        key :operationId, :change_active_research_network
        key :produces, ['application/json',]
        key :tags, ['Research Networks']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research network to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :research_network do
          key :in, :body
          key :description, 'Research network to activate or deactivate'
          key :required, true
          schema do
            property :research_network do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'research network response'
          schema do
            key :'$ref', :ResearchNetworkOutput
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

    swagger_path '/research_networks' do
      operation :get do
        key :summary, 'Get all Research networks'
        key :description, 'Returns all research networks'
        key :operationId, :get_research_networks
        key :produces, ['application/json',]
        key :tags, ['Research Networks']

        response 200 do
          key :description, 'research network response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ResearchNetworkDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Research network'
        key :description, 'Returns the created research network'
        key :operationId, :create_research_network
        key :produces, ['application/json',]
        key :tags, ['Research Networks']

        parameter name: :research_network do
          key :in, :body
          key :description, 'Research network to register'
          key :required, true
          schema do
            key :'$ref', :ResearchNetworkInputPost
          end
        end

        response 201 do
          key :description, 'research network response'
          schema do
            key :'$ref', :ResearchNetworkOutput
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