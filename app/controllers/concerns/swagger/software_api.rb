module Swagger::SoftwareApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_units/{research_group_id}/software/{id}' do
      operation :get do
        key :summary, 'Get a Software of a Research Unit by ID'
        key :description, 'Returns a single software'
        key :operationId, :get_software_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Software']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of software of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'software response'
          schema do
            key :'$ref', :SoftwareOutput
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
        key :summary, 'Update Software by ID'
        key :description, 'Returns the updated software'
        key :operationId, :update_software
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Software']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of software of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :software do
          key :in, :body
          key :description, 'Software to update'
          key :required, true
          schema do
            key :'$ref', :SoftwareInputPut
          end
        end

        response 200 do
          key :description, 'Software response'
          schema do
            key :'$ref', :SoftwareOutput
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

    swagger_path '/research_units/{research_group_id}/software/' do
      operation :get do
        key :summary, 'Get all Software'
        key :description, 'Returns all software'
        key :operationId, :get_software
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Software']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'software response'
          schema do
            key :type, :array
            items do
              key :'$ref', :SoftwareDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Software'
        key :description, 'Returns the created software'
        key :operationId, :create_software
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Software']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :software do
          key :in, :body
          key :description, 'Software to register'
          key :required, true
          schema do
            key :'$ref', :SoftwareInputPost
          end
        end

        response 201 do
          key :description, 'software response'
          schema do
            key :'$ref', :SoftwareOutput
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

    swagger_path '/research_units/{research_group_id}/software/{id}/active' do
      operation :put do
        key :summary, 'Activate or deactivate a Software by ID'
        key :description, 'Returns the activated/deactivated software'
        key :operationId, :change_active_software
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Software']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of software of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :software do
          key :in, :body
          key :description, 'Software to update'
          key :required, true
          schema do
            key :'$ref', :SoftwareInputPut
          end
        end

        response 200 do
          key :description, 'Software response'
          schema do
            key :'$ref', :SoftwareOutput
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