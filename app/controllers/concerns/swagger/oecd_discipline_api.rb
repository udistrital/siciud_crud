module Swagger::OecdDisciplineApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/oecd_disciplines/{id}' do
      operation :put do
        key :summary, 'Update OECD discipline by ID'
        key :description, 'Returns the updated OECD discipline'
        key :operationId, :update_oecd_discipline
        key :produces, ['application/json',]
        key :tags, ['OECD - Organisation for Economic Co-operation and Development::Disciplines']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of OECD discipline to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :oecd_discipline do
          key :in, :body
          key :description, 'OECD discipline to update'
          key :required, true
          schema do
            key :'$ref', :OecdDisciplineInput
          end
        end

        response 200 do
          key :description, 'OECD discipline response'
          schema do
            key :'$ref', :OecdDisciplineOutput
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

    swagger_path '/oecd_disciplines' do
      operation :get do
        key :summary, 'Get all OECD disciplines'
        key :description, 'Returns all OECD disciplines'
        key :operationId, :get_oecd_disciplines
        key :produces, ['application/json',]
        key :tags, ['OECD - Organisation for Economic Co-operation and Development::Disciplines']

        response 200 do
          key :description, 'OECD discipline response'
          schema do
            key :type, :array
            items do
              key :'$ref', :OecdDisciplineOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new OECD discipline'
        key :description, 'Returns the created broad area'
        key :operationId, :create_oecd_discipline
        key :produces, ['application/json',]
        key :tags, ['OECD - Organisation for Economic Co-operation and Development::Disciplines']

        parameter name: :oecd_discipline do
          key :in, :body
          key :description, 'Broad Area to register'
          key :required, true
          schema do
            key :'$ref', :OecdDisciplineInput
          end
        end

        response 201 do
          key :description, 'OECD discipline response'
          schema do
            key :'$ref', :OecdDisciplineOutput
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