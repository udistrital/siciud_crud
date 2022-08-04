module Swagger::ImpactApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/impacts/{id}' do
      operation :get do
        key :summary, 'Get a impact by ID'
        key :description, 'Returns a single impact'
        key :operationId, :get_impact_by_id
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Impacts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of impact to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'impact response'
          schema do
            key :'$ref', :ImpactOutput
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
        key :summary, 'Update impact by ID'
        key :description, 'Returns the updated impact'
        key :operationId, :update_impact
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Impacts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of impact to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :impact do
          key :in, :body
          key :description, 'Impact to update'
          key :required, true
          schema do
            key :'$ref', :ImpactInputPut
          end
        end

        response 200 do
          key :description, 'impact response'
          schema do
            key :'$ref', :ImpactOutput
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
        key :summary, 'Activate or deactivate a impact by ID'
        key :description, 'Returns the activated/deactivated impact'
        key :operationId, :change_active_impact
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Impacts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of impact to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :impact do
          key :in, :body
          key :description, 'Impact to activate or deactivate'
          key :required, true
          schema do
            property :impact do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'impact response'
          schema do
            key :'$ref', :ImpactOutput
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

    swagger_path '/proposals/{proposal_id}/impacts' do
      operation :get do
        key :summary, 'Get all  impacts'
        key :description, 'Returns all impacts'
        key :operationId, :get_impacts
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Impacts']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'impact response'
          schema do
            key :'$ref', :ImpactDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new impact'
        key :description, 'Returns the created impact'
        key :operationId, :create_impact
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Impacts']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :impact do
          key :in, :body
          key :description, 'Impact to register'
          key :required, true
          schema do
            key :'$ref', :ImpactInputPost
          end
        end

        response 201 do
          key :description, 'impact response'
          schema do
            key :'$ref', :ImpactOutput
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