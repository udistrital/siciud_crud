module Swagger::CreationWorkshopApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/creation_workshops/{id}' do
      operation :get do
        key :summary, 'Get a Creation Workshop by ID'
        key :description, 'Returns a single Creation Workshop'
        key :operationId, :get_creation_workshop_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Creation Workshops']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Creation Workshop to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'creation workshop response'
          schema do
            key :'$ref', :CreationWorkshopOutput
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
        key :summary, 'Update Creation Workshop by ID'
        key :description, 'Returns the updated Creation Workshop'
        key :operationId, :update_creation_workshop
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Creation Workshops']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Creation Workshop to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :creation_workshop do
          key :in, :body
          key :description, 'Creation Workshop to update'
          key :required, true
          schema do
            key :'$ref', :CreationWorkshopInputPut
          end
        end

        response 200 do
          key :description, 'creation workshop response'
          schema do
            key :'$ref', :CreationWorkshopOutput
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
        key :summary, 'Activate or deactivate a Creation Workshop by ID'
        key :description, 'Returns the activated/deactivated Creation Workshop'
        key :operationId, :change_active_creation_workshop
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Creation Workshops']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Creation Workshop to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :creation_workshop do
          key :in, :body
          key :description, 'Creation Workshop to activate or deactivate'
          key :required, true
          schema do
            property :creation_workshop do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'creation workshop response'
          schema do
            key :'$ref', :CreationWorkshopOutput
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

    swagger_path '/research_units/{research_group_id}/creation_workshops' do
      operation :get do
        key :summary, 'Get all Creation Workshops'
        key :description, 'Returns all Creation Workshops'
        key :operationId, :get_creation_workshops
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Creation Workshops']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'creation workshop response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CreationWorkshopDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Creation Workshops'
        key :description, 'Returns the created Creation Workshop'
        key :operationId, :create_creation_workshop
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Creation Workshops']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :creation_workshop do
          key :in, :body
          key :description, 'Creation Workshop to register'
          key :required, true
          schema do
            key :'$ref', :CreationWorkshopInputPost
          end
        end

        response 201 do
          key :description, 'creation workshop response'
          schema do
            key :'$ref', :CreationWorkshopOutput
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