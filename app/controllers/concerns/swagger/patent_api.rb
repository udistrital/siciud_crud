module Swagger::PatentApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_units/{research_group_id}/patents/{id}' do
      operation :get do
        key :summary, 'Get a Patent of a Research Unit by ID'
        key :description, 'Returns a single patent'
        key :operationId, :get_patent_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Patents']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of patent of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'patent response'
          schema do
            key :'$ref', :PatentOutput
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
        key :summary, 'Update Patent by ID'
        key :description, 'Returns the updated patent'
        key :operationId, :update_patent
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Patents']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of patent of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :patent do
          key :in, :body
          key :description, 'Patent to update'
          key :required, true
          schema do
            key :'$ref', :PatentInputPut
          end
        end

        response 200 do
          key :description, 'patent response'
          schema do
            key :'$ref', :PatentOutput
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

    swagger_path '/research_units/{research_group_id}/patents/' do
      operation :get do
        key :summary, 'Get all Patents'
        key :description, 'Returns all patents'
        key :operationId, :get_patents
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Patents']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'patent response'
          schema do
            key :type, :array
            items do
              key :'$ref', :PatentDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Patent'
        key :description, 'Returns the created patent'
        key :operationId, :create_patent
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Patents']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :patent do
          key :in, :body
          key :description, 'Patent to register'
          key :required, true
          schema do
            key :'$ref', :PatentInputPost
          end
        end

        response 201 do
          key :description, 'patent response'
          schema do
            key :'$ref', :PatentOutput
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

    swagger_path '/research_units/{research_group_id}/patents/{id}/active' do
      operation :put do
        key :summary, 'Activate or deactivate a Patent by ID'
        key :description, 'Returns the activated/deactivated patent by id'
        key :operationId, :change_active_patent
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Patents']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of patent of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :patent do
          key :in, :body
          key :description, 'Patent to update'
          key :required, true
          schema do
            property :patent do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'patent response'
          schema do
            key :'$ref', :PatentOutput
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