module Swagger::RegulationApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/regulations/{id}' do
      operation :get do
        key :summary, 'Get a Regulation by ID'
        key :description, 'Returns a single Regulation'
        key :operationId, :get_regulation_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Regulations']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Regulation to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'regulation response'
          schema do
            key :'$ref', :RegulationOutput
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
        key :summary, 'Update Regulation by ID'
        key :description, 'Returns the updated Regulation'
        key :operationId, :update_regulation
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Regulations']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Regulation to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :regulation do
          key :in, :body
          key :description, 'regulation to update'
          key :required, true
          schema do
            key :'$ref', :RegulationInputPut
          end
        end

        response 200 do
          key :description, 'regulation response'
          schema do
            key :'$ref', :RegulationOutput
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
        key :summary, 'Activate or deactivate a Regulation by ID'
        key :description, 'Returns the activated/deactivated Regulation'
        key :operationId, :change_active_regulation
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Regulations']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Regulation to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :regulation do
          key :in, :body
          key :description, 'Regulation to activate or deactivate'
          key :required, true
          schema do
            property :regulation do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'regulation response'
          schema do
            key :'$ref', :RegulationOutput
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

    swagger_path '/research_units/{research_group_id}/regulations/' do
      operation :get do
        key :summary, 'Get all Regulations'
        key :description, 'Returns all Regulations'
        key :operationId, :get_regulations
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Regulations']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'regulation response'
          schema do
            key :type, :array
            items do
              key :'$ref', :RegulationDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Regulations'
        key :description, 'Returns the created Regulation'
        key :operationId, :create_regulation
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Regulations']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :regulation do
          key :in, :body
          key :description, 'Regulation to register'
          key :required, true
          schema do
            key :'$ref', :RegulationInputPost
          end
        end

        response 201 do
          key :description, 'regulation response'
          schema do
            key :'$ref', :RegulationOutput
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