module Swagger::ProtocolActApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/protocol_acts/{id}' do
      operation :get do
        key :summary, 'Get a Protocol Act by ID'
        key :description, 'Returns a single Protocol Act'
        key :operationId, :get_protocol_act_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Protocol Acts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Protocol Act to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'protocol act response'
          schema do
            key :'$ref', :ProtocolActOutput
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
        key :summary, 'Update Protocol Act by ID'
        key :description, 'Returns the updated Protocol Act'
        key :operationId, :update_protocol_act
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Protocol Acts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Protocol Act to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :protocol_act do
          key :in, :body
          key :description, 'Protocol Act to update'
          key :required, true
          schema do
            key :'$ref', :ProtocolActInputPut
          end
        end

        response 200 do
          key :description, 'protocol act response'
          schema do
            key :'$ref', :ProtocolActOutput
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
        key :summary, 'Activate or deactivate a Protocol Act by ID'
        key :description, 'Returns the activated/deactivated Protocol Act'
        key :operationId, :change_active_protocol_act
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Protocol Acts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Protocol Act to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :protocol_act do
          key :in, :body
          key :description, 'Protocol Act to activate or deactivate'
          key :required, true
          schema do
            property :protocol_act do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'protocol act response'
          schema do
            key :'$ref', :ProtocolActOutput
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

    swagger_path '/research_units/{research_group_id}/protocol_acts/' do
      operation :get do
        key :summary, 'Get all Protocol Acts'
        key :description, 'Returns all Protocol Acts'
        key :operationId, :get_protocol_acts
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Protocol Acts']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'protocol act response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ProtocolActDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Protocol Acts'
        key :description, 'Returns the created Protocol Act'
        key :operationId, :create_protocol_act
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Protocol Acts']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :protocol_act do
          key :in, :body
          key :description, 'Protocol Act to register'
          key :required, true
          schema do
            key :'$ref', :ProtocolActInputPost
          end
        end

        response 201 do
          key :description, 'protocol act response'
          schema do
            key :'$ref', :ProtocolActOutput
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