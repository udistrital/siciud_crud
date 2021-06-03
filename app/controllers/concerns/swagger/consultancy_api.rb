module Swagger::ConsultancyApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/consultancies/{id}' do
      operation :get do
        key :summary, 'Get a Consultancy by ID'
        key :description, 'Returns a single consultancy'
        key :operationId, :get_consultancy_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Consultancies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of consultancy to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'consultancy response'
          schema do
            key :'$ref', :ConsultancyOutput
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
        key :summary, 'Update consultancy by ID'
        key :description, 'Returns the updated consultancy'
        key :operationId, :update_consultancy
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Consultancies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of consultancy to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :consultancy do
          key :in, :body
          key :description, 'consultancy to update'
          key :required, true
          schema do
            key :'$ref', :ConsultancyInputPut
          end
        end

        response 200 do
          key :description, 'consultancy response'
          schema do
            key :'$ref', :ConsultancyOutput
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
        key :summary, 'Activate or deactivate a consultancy by ID'
        key :description, 'Returns the activated/deactivated consultancy'
        key :operationId, :change_active_consultancy
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Consultancies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of consultancy to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :consultancy do
          key :in, :body
          key :description, 'consultancy to activate or deactivate'
          key :required, true
          schema do
            property :consultancy do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'consultancy response'
          schema do
            key :'$ref', :ConsultancyOutput
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

    swagger_path '/research_units/{research_group_id}/consultancies' do
      operation :get do
        key :summary, 'Get all Consultancies'
        key :description, 'Returns all Consultancies'
        key :operationId, :get_consultancies
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Consultancies']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'consultancy response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ConsultancyDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Consultancies'
        key :description, 'Returns the created consultancy'
        key :operationId, :create_consultancy
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Consultancies']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :consultancy do
          key :in, :body
          key :description, 'consultancy to register'
          key :required, true
          schema do
            key :'$ref', :ConsultancyInputPost
          end
        end

        response 201 do
          key :description, 'consultancy response'
          schema do
            key :'$ref', :ConsultancyOutput
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