module Swagger::DistinctiveSignApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/distinctive_signs/{id}' do
      operation :get do
        key :summary, 'Get a Distinctive Sign by ID'
        key :description, 'Returns a single distinctive sign'
        key :operationId, :get_distinctive_sign_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Distinctive Signs']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Distinctive Sign to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'distinctive sign response'
          schema do
            key :'$ref', :DistinctiveSignOutput
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
        key :summary, 'Update Distinctive Sign by ID'
        key :description, 'Returns the updated distinctive sign'
        key :operationId, :update_distinctive_sign
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Distinctive Signs']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Distinctive Sign to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :distinctive_sign do
          key :in, :body
          key :description, 'Distinctive Sign to update'
          key :required, true
          schema do
            key :'$ref', :DistinctiveSignInputPut
          end
        end

        response 200 do
          key :description, 'distinctive sign response'
          schema do
            key :'$ref', :DistinctiveSignOutput
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
        key :summary, 'Activate or deactivate a Distinctive Sign by ID'
        key :description, 'Returns the activated/deactivated distinctive sign'
        key :operationId, :change_active_distinctive_sign
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Distinctive Signs']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Distinctive Sign to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :distinctive_sign do
          key :in, :body
          key :description, 'Distinctive Sign to update'
          key :required, true
          schema do
            property :distinctive_sign do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'distinctive sign response'
          schema do
            key :'$ref', :DistinctiveSignOutput
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

    swagger_path '/research_units/{research_group_id}/distinctive_signs' do
      operation :get do
        key :summary, 'Get all Distinctive Signs'
        key :description, 'Returns all Distinctive Signs'
        key :operationId, :get_distinctive_signs
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Distinctive Signs']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'distinctive sign response'
          schema do
            key :type, :array
            items do
              key :'$ref', :DistinctiveSignDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Distinctive Signs'
        key :description, 'Returns the created Distinctive Sign'
        key :operationId, :create_distinctive_sign
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Distinctive Signs']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :distinctive_sign do
          key :in, :body
          key :description, 'Distinctive Sign to register'
          key :required, true
          schema do
            key :'$ref', :DistinctiveSignInputPost
          end
        end

        response 201 do
          key :description, 'distinctive sign response'
          schema do
            key :'$ref', :DistinctiveSignOutput
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