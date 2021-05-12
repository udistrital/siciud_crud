module Swagger::EnterpriseApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/enterprises/{id}' do
      operation :get do
        key :summary, 'Get a Enterprise by ID'
        key :description, 'Returns a single Enterprise'
        key :operationId, :get_enterprise_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Enterprises']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Enterprise to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Enterprise response'
          schema do
            key :'$ref', :EnterpriseOutput
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
        key :summary, 'Update Enterprise by ID'
        key :description, 'Returns the updated Enterprise'
        key :operationId, :update_enterprise
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Enterprises']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Enterprise to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :enterprise do
          key :in, :body
          key :description, 'Enterprise to update'
          key :required, true
          schema do
            key :'$ref', :EnterpriseInputPut
          end
        end

        response 200 do
          key :description, 'Enterprise response'
          schema do
            key :'$ref', :EnterpriseOutput
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
        key :summary, 'Activate or deactivate a Enterprise by ID'
        key :description, 'Returns the activated/deactivated Enterprise'
        key :operationId, :change_active_enterprise
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Enterprises']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Enterprise to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :enterprise do
          key :in, :body
          key :description, 'Enterprise to activate or deactivate'
          key :required, true
          schema do
            property :enterprise do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'Enterprise response'
          schema do
            key :'$ref', :EnterpriseOutput
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

    swagger_path '/research_units/{research_group_id}/enterprises/' do
      operation :get do
        key :summary, 'Get all Enterprises'
        key :description, 'Returns all Enterprises'
        key :operationId, :get_enterprises
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Enterprises']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :product_type_id do
          key :in, :query
          key :description, 'ID of type to fetch'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Enterprise response'
          schema do
            key :type, :array
            items do
              key :'$ref', :EnterpriseDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Enterprises'
        key :description, 'Returns the created Enterprise'
        key :operationId, :create_enterprise
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Enterprises']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :enterprise do
          key :in, :body
          key :description, 'Enterprise to register'
          key :required, true
          schema do
            key :'$ref', :EnterpriseInputPost
          end
        end

        response 201 do
          key :description, 'Enterprise response'
          schema do
            key :'$ref', :EnterpriseOutput
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