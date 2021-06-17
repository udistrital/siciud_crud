

module Swagger::AccompanimentConsultancyApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/accompaniment_consultancies/{id}' do
      operation :get do
        key :summary, 'Get a Accompaniment Consultancies by ID'
        key :description, 'Returns a single accompaniment consultancy'
        key :operationId, :get_accompaniment_consultancy_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Accompaniment Consultancies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of accompaniment consultancy to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'accompaniment consultancy response'
          schema do
            key :'$ref', :AccompanimentConsultancyOutput
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
        key :summary, 'Update Accompaniment Consultancies by ID'
        key :description, 'Returns the updated accompaniment consultancy'
        key :operationId, :update_accompaniment_consultancy
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Accompaniment Consultancies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of accompaniment consultancy to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :accompaniment_consultancy do
          key :in, :body
          key :description, 'Accompaniment Consultancies to update'
          key :required, true
          schema do
            key :'$ref', :AccompanimentConsultancyInputPut
          end
        end

        response 200 do
          key :description, 'accompaniment consultancy response'
          schema do
            key :'$ref', :AccompanimentConsultancyOutput
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
        key :summary, 'Activate or deactivate a Accompaniment Consultancies by ID'
        key :description, 'Returns the activated/deactivated accompaniment consultancy'
        key :operationId, :change_active_accompaniment_consultancy
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Accompaniment Consultancies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of accompaniment consultancy to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :accompaniment_consultancy do
          key :in, :body
          key :description, 'Accompaniment Consultancies to activate or deactivate'
          key :required, true
          schema do
            property :accompaniment_consultancy do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'accompaniment consultancy response'
          schema do
            key :'$ref', :AccompanimentConsultancyOutput
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

    swagger_path '/research_units/{research_group_id}/accompaniment_consultancies' do
      operation :get do
        key :summary, 'Get all Accompaniment Consultancies'
        key :description, 'Returns all Accompaniment Consultancies'
        key :operationId, :get_accompaniment_consultancies
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Accompaniment Consultancies']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'accompaniment consultancy response'
          schema do
            key :type, :array
            items do
              key :'$ref', :AccompanimentConsultancyDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Accompaniment Consultancies'
        key :description, 'Returns the created accompaniment consultancy'
        key :operationId, :create_accompaniment_consultancy
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Accompaniment Consultancies']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :accompaniment_consultancy do
          key :in, :body
          key :description, 'Accompaniment Consultancies to register'
          key :required, true
          schema do
            key :'$ref', :AccompanimentConsultancyInputPost
          end
        end

        response 201 do
          key :description, 'accompaniment consultancy response'
          schema do
            key :'$ref', :AccompanimentConsultancyOutput
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