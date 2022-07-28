module Swagger::RiskApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/risks/{id}' do
      operation :get do
        key :summary, 'Get an risk by ID'
        key :description, 'Returns a single risk'
        key :operationId, :get_risk_by_id
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Risks']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of risk to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Risk response'
          schema do
            key :'$ref', :RiskOutput
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
        key :summary, 'Update risk by ID'
        key :description, 'Returns the updated risk'
        key :operationId, :update_risk
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Risks']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of risk to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :risk do
          key :in, :body
          key :description, 'Risk to update'
          key :required, true
          schema do
            key :'$ref', :RiskInputPut
          end
        end

        response 200 do
          key :description, 'risk response'
          schema do
            key :'$ref', :RiskOutput
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
        key :summary, 'Activate or deactivate an risk by ID'
        key :description, 'Returns the activated/deactivated risk'
        key :operationId, :change_active_Risk
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Risks']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of risk to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :risk do
          key :in, :body
          key :description, 'Risk to activate or deactivate'
          key :required, true
          schema do
            property :risk do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'risk response'
          schema do
            key :'$ref', :RiskOutput
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

    swagger_path '/proposals/{proposal_id}/risks' do
      operation :get do
        key :summary, 'Get all risks'
        key :description, 'Returns all risks'
        key :operationId, :get_risks
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Risks']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'risk response'
          schema do
            key :'$ref', :RiskDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new risk'
        key :description, 'Returns the created risk'
        key :operationId, :create_risk
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Risks']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :risk do
          key :in, :body
          key :description, 'Risk to register'
          key :required, true
          schema do
            key :'$ref', :RiskInputPost
          end
        end

        response 201 do
          key :description, 'risk response'
          schema do
            key :'$ref', :RiskOutput
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