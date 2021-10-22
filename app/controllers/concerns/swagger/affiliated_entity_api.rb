module Swagger::AffiliatedEntityApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/affiliated_entities/{id}' do
      operation :get do
        key :summary, 'Get a Affiliated Entity by ID'
        key :description, 'Returns a single affiliated Entity'
        key :operationId, :get_affiliated_entity_by_id
        key :produces, ['application/json',]
        key :tags, ['Affiliated Entities']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of affiliated Entity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'affiliated entity response'
          schema do
            key :'$ref', :AffiliatedEntityOutput
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
        key :summary, 'Update Affiliated Entity by ID'
        key :description, 'Returns the updated affiliated Entity'
        key :operationId, :update_affiliated_entity
        key :produces, ['application/json',]
        key :tags, ['Affiliated Entities']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of affiliated entity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :affiliated_entity do
          key :in, :body
          key :description, 'Affiliated Entity to update'
          key :required, true
          schema do
            key :'$ref', :AffiliatedEntityInputPut
          end
        end

        response 200 do
          key :description, 'affiliated entity response'
          schema do
            key :'$ref', :AffiliatedEntityOutput
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
        key :summary, 'Activate or deactivate a Affiliated Entity by ID'
        key :description, 'Returns the activated/deactivated affiliated Entity'
        key :operationId, :change_active_affiliated_entity
        key :produces, ['application/json',]
        key :tags, ['Affiliated Entities']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of affiliated Entity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :affiliated_entity do
          key :in, :body
          key :description, 'Affiliated Entity to activate or deactivate'
          key :required, true
          schema do
            property :affiliated_entity do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'affiliated entity response'
          schema do
            key :'$ref', :AffiliatedEntityOutput
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

    swagger_path '/research_networks/{research_network_id}/affiliated_entities' do
      operation :get do
        key :summary, 'Get all Affiliated Entities'
        key :description, 'Returns all affiliated Entities'
        key :operationId, :get_research_networks_affiliated_entities
        key :produces, ['application/json',]
        key :tags, ['Affiliated Entities']

        parameter name: :research_network_id do
          key :in, :path
          key :description, 'ID of research network to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'affiliated entity response'
          schema do
            key :type, :array
            items do
              key :'$ref', :AffiliatedEntityDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Affiliated Entity'
        key :description, 'Returns the created affiliated Entity'
        key :operationId, :create_affiliated_entity
        key :produces, ['application/json',]
        key :tags, ['Affiliated Entities']

        parameter name: :research_network_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :affiliated_entity do
          key :in, :body
          key :description, 'Affiliated Entity to register'
          key :required, true
          schema do
            key :'$ref', :AffiliatedEntityInputPost
          end
        end

        response 201 do
          key :description, 'affiliated entity response'
          schema do
            key :'$ref', :AffiliatedEntityOutput
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

    swagger_path '/affiliated_entities' do
      operation :get do
        key :summary, 'Get all Affiliated Entities'
        key :description, 'Returns all affiliated Entities'
        key :operationId, :get_affiliated_entities
        key :produces, ['application/json',]
        key :tags, ['Affiliated Entities']

        parameter name: :research_network_id do
          key :in, :query
          key :description, 'ID of research network to fetch'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'affiliated entity response'
          schema do
            key :type, :array
            items do
              key :'$ref', :AffiliatedEntityDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end
  end
end