
module Swagger::MagazineEditionApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/magazine_editions/{id}' do
      operation :get do
        key :summary, 'Get a Magazine Edition by ID'
        key :description, 'Returns a single magazine edition'
        key :operationId, :get_magazine_edition_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Magazine Edition']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of magazine edition to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'magazine edition response'
          schema do
            key :'$ref', :MagazineEditionOutput
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
        key :summary, 'Update Magazine Edition by ID'
        key :description, 'Returns the updated magazine edition'
        key :operationId, :update_magazine_edition
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Magazine Edition']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of magazine edition to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :magazine_edition do
          key :in, :body
          key :description, 'Magazine Edition to update'
          key :required, true
          schema do
            key :'$ref', :MagazineEditionInputPut
          end
        end

        response 200 do
          key :description, 'magazine edition response'
          schema do
            key :'$ref', :MagazineEditionOutput
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
        key :summary, 'Activate or deactivate a Magazine Edition by ID'
        key :description, 'Returns the activated/deactivated magazine edition'
        key :operationId, :change_active_magazine_edition
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Magazine Edition']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of magazine edition to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :magazine_edition do
          key :in, :body
          key :description, 'Magazine Edition to activate or deactivate'
          key :required, true
          schema do
            property :magazine_edition do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'magazine edition response'
          schema do
            key :'$ref', :MagazineEditionOutput
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

    swagger_path '/research_units/{research_group_id}/magazine_editions' do
      operation :get do
        key :summary, 'Get all Magazine Edition'
        key :description, 'Returns all Magazine Edition'
        key :operationId, :get_magazine_editions
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Magazine Edition']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'magazine edition response'
          schema do
            key :type, :array
            items do
              key :'$ref', :MagazineEditionDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Magazine Edition'
        key :description, 'Returns the created magazine edition'
        key :operationId, :create_magazine_edition
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Magazine Edition']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :magazine_edition do
          key :in, :body
          key :description, 'Magazine Edition to register'
          key :required, true
          schema do
            key :'$ref', :MagazineEditionInputPost
          end
        end

        response 201 do
          key :description, 'magazine edition response'
          schema do
            key :'$ref', :MagazineEditionOutput
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