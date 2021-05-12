module Swagger::NewScientificRecordApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_units/{research_group_id}/new_scientific_records/{id}' do
      operation :get do
        key :summary, 'Get a new Scientific Record of a Research Unit by ID'
        key :description, 'Returns a single Scientific Record'
        key :operationId, :get_new_scientific_record_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::New Scientific Records']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of new Scientific Record of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'new Scientific Record response'
          schema do
            key :'$ref', :NewScientificRecordOutput
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
        key :summary, 'Update new Scientific Record by ID'
        key :description, 'Returns the updated new Scientific Record'
        key :operationId, :update_new_scientific_record_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::New Scientific Records']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of new Scientific Record of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :new_scientific_record do
          key :in, :body
          key :description, 'new Scientific Record to update'
          key :required, true
          schema do
            key :'$ref', :NewScientificRecordInputPut
          end
        end

        response 200 do
          key :description, 'new Scientific Record response'
          schema do
            key :'$ref', :NewScientificRecordOutput
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

    swagger_path '/research_units/{research_group_id}/new_scientific_records/' do
      operation :get do
        key :summary, 'Get all new Scientific Record'
        key :description, 'Returns all new Scientific Record'
        key :operationId, :get_new_scientific_record
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::New Scientific Records']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'new Scientific Record response'
          schema do
            key :type, :array
            items do
              key :'$ref', :NewScientificRecordDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Scientific Record'
        key :description, 'Returns the created new Scientific Record'
        key :operationId, :create_new_scientific_record
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::New Scientific Records']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :new_scientific_record do
          key :in, :body
          key :description, 'new Scientific Record to register'
          key :required, true
          schema do
            key :'$ref', :NewScientificRecordInputPost
          end
        end

        response 201 do
          key :description, 'new Scientific Record response'
          schema do
            key :'$ref', :NewScientificRecordOutput
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

    swagger_path '/research_units/{research_group_id}/new_scientific_records/{id}/active' do
      operation :put do
        key :summary, 'Activate or deactivate a New Scientific Record by ID'
        key :description, 'Returns the activated/deactivated new Scientific Record'
        key :operationId, :change_active_new_scientific_record_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::New Scientific Records']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of new Scientific Record of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :new_scientific_record do
          key :in, :body
          key :description, 'new Scientific Record to update'
          key :required, true
          schema do
            property :new_scientific_record do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'new Scientific Record response'
          schema do
            key :'$ref', :NewScientificRecordOutput
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