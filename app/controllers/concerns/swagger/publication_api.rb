module Swagger::PublicationApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/publications/{id}' do
      operation :get do
        key :summary, 'Get a Publication by ID'
        key :description, 'Returns a single publication'
        key :operationId, :get_publication_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Publications']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of publication to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'publication response'
          schema do
            key :'$ref', :PublicationOutput
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
        key :summary, 'Update Publication by ID'
        key :description, 'Returns the updated publication'
        key :operationId, :update_publication
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Publications']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of publication to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :publication do
          key :in, :body
          key :description, 'Publication to update'
          key :required, true
          schema do
            key :'$ref', :PublicationInputPut
          end
        end

        response 200 do
          key :description, 'publication response'
          schema do
            key :'$ref', :PublicationOutput
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
        key :summary, 'Activate or deactivate a Publication by ID'
        key :description, 'Returns the activated/deactivated publication'
        key :operationId, :change_active_publication
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Publications']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of publication to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :publication do
          key :in, :body
          key :description, 'Publication to activate or deactivate'
          key :required, true
          schema do
            property :publication do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'publication response'
          schema do
            key :'$ref', :PublicationOutput
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

    swagger_path '/research_units/{research_group_id}/publications' do
      operation :get do
        key :summary, 'Get all Publications'
        key :description, 'Returns all Publications'
        key :operationId, :get_publications
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Publications']

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
          key :description, 'publication response'
          schema do
            key :type, :array
            items do
              key :'$ref', :PublicationDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Publications'
        key :description, 'Returns the created publication'
        key :operationId, :create_publication
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Publications']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :publication do
          key :in, :body
          key :description, 'Publication to register'
          key :required, true
          schema do
            key :'$ref', :PublicationInputPost
          end
        end

        response 201 do
          key :description, 'publication response'
          schema do
            key :'$ref', :PublicationOutput
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