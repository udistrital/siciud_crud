module Swagger::RgResearchNetworkApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_groups_research_networks/{id}' do
      operation :get do
        key :summary, 'Get a Research network research group by ID'
        key :description, 'Returns a single research network research group'
        key :operationId, :get_rn_research_group_by_id
        key :produces, ['application/json',]
        key :tags, ['Research Networks:: Research Groups']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research network research group to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'research network research group response'
          schema do
            key :'$ref', :ResearchGroupsResearchNetworkOutput
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
        key :summary, 'Update Research network research group by ID'
        key :description, 'Returns the updated research network research group'
        key :operationId, :update_rn_research_group
        key :produces, ['application/json',]
        key :tags, ['Research Networks:: Research Groups']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research network research group to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :research_groups_research_network do
          key :in, :body
          key :description, 'Research network research group to update'
          key :required, true
          schema do
            key :'$ref', :ResearchGroupsResearchNetworkInputPut
          end
        end

        response 200 do
          key :description, 'research network research group response'
          schema do
            key :'$ref', :ResearchGroupsResearchNetworkOutput
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
        key :summary, 'Activate or deactivate a Research network research group by ID'
        key :description, 'Returns the activated/deactivated research network research group'
        key :operationId, :change_active_rn_research_group
        key :produces, ['application/json',]
        key :tags, ['Research Networks:: Research Groups']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research network research group to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :research_groups_research_network do
          key :in, :body
          key :description, 'Research network research group to activate or deactivate'
          key :required, true
          schema do
            property :research_groups_research_network do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'research network research group response'
          schema do
            key :'$ref', :ResearchGroupsResearchNetworkOutput
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

    swagger_path '/research_networks/{research_network_id}/research_groups_research_networks' do
      operation :get do
        key :summary, 'Get all Research network research groups'
        key :description, 'Returns all research network research groups'
        key :operationId, :get_research_groups_research_networks
        key :produces, ['application/json',]
        key :tags, ['Research Networks:: Research Groups']

        parameter name: :research_network_id do
          key :in, :path
          key :description, 'ID of research network to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'research network research group response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ResearchGroupsResearchNetworkDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Research network research group'
        key :description, 'Returns the created research network research group'
        key :operationId, :create_rn_research_group
        key :produces, ['application/json',]
        key :tags, ['Research Networks:: Research Groups']

        parameter name: :research_network_id do
          key :in, :path
          key :description, 'ID of research network to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :research_groups_research_network do
          key :in, :body
          key :description, 'Research network research group to register'
          key :required, true
          schema do
            key :'$ref', :ResearchGroupsResearchNetworkInputPost
          end
        end

        response 201 do
          key :description, 'research network research group response'
          schema do
            key :'$ref', :ResearchGroupsResearchNetworkOutput
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