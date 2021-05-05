module Swagger::EnterpriseSecretApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/enterprise_secrets/{id}' do
      operation :get do
        key :summary, 'Get a Enterprise Secret by ID'
        key :description, 'Returns a single Enterprise Secret'
        key :operationId, :get_enterprise_secret_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Enterprise Secrets']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Enterprise Secret to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'enterprise secret response'
          schema do
            key :'$ref', :EnterpriseSecretOutput
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
        key :summary, 'Update a Enterprise Secret by ID'
        key :description, 'Returns the updated Enterprise Secret'
        key :operationId, :update_enterprise_secret
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Enterprise Secrets']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Enterprise Secret to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :enterprise_secret do
          key :in, :body
          key :description, 'Enterprise Secret to update'
          key :required, true
          schema do
            key :'$ref', :EnterpriseSecretInputPut
          end
        end

        response 200 do
          key :description, 'enterprise secret response'
          schema do
            key :'$ref', :EnterpriseSecretOutput
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
        key :summary, 'Activate or deactivate a Enterprise Secret by ID'
        key :description, 'Returns the activated/deactivated Enterprise Secret'
        key :operationId, :change_active_enterprise_secret
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Enterprise Secrets']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Enterprise Secret to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :enterprise_secret do
          key :in, :body
          key :description, 'Enterprise Secret to activate or deactivate'
          key :required, true
          schema do
            property :enterprise_secret do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'enterprise secret response'
          schema do
            key :'$ref', :EnterpriseSecretOutput
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

    swagger_path '/research_units/{research_group_id}/enterprise_secrets/' do
      operation :get do
        key :summary, 'Get all Enterprise Secrets'
        key :description, 'Returns all Enterprise Secrets'
        key :operationId, :get_enterprise_secrets
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Enterprise Secrets']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'enterprise secret response'
          schema do
            key :type, :array
            items do
              key :'$ref', :EnterpriseSecretDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Enterprise Secrets'
        key :description, 'Returns the created Enterprise Secret'
        key :operationId, :create_enterprise_secret
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Enterprise Secrets']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :enterprise_secret do
          key :in, :body
          key :description, 'Enterprise Secret to register'
          key :required, true
          schema do
            key :'$ref', :EnterpriseSecretInputPost
          end
        end

        response 201 do
          key :description, 'enterprise secret response'
          schema do
            key :'$ref', :EnterpriseSecretOutput
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