module Swagger::DegreeWorkApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_units/{research_group_id}/degree_works/{id}' do
      operation :get do
        key :summary, 'Get a degree_works of a Research Unit by ID'
        key :description, 'Returns a single degree_works'
        key :operationId, :get_degree_work_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::DegreeWorks']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of degree_works of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'degree_works response'
          schema do
            key :'$ref', :DegreeWorkOutput
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
        key :summary, 'Update Pdegree_works by ID'
        key :description, 'Returns the updated degree_works'
        key :operationId, :update_degree_work_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::DegreeWorks']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Plant or Industrial Prototype of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :degree_work do
          key :in, :body
          key :description, 'Degree works to update'
          key :required, true
          schema do
            key :'$ref', :DegreeWorkInputPut
          end
        end

        response 200 do
          key :description, 'Degree works response'
          schema do
            key :'$ref', :DegreeWorkOutput
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

    swagger_path '/research_units/{research_group_id}/degree_works/' do
      operation :get do
        key :summary, 'Get all Degree works'
        key :description, 'Returns all Degree works '
        key :operationId, :get_degree_work
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::DegreeWorks']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :dw_type_id do
          key :in, :query
          key :description, 'ID of type to fetch'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Degree works response'
          schema do
            key :type, :array
            items do
              key :'$ref', :DegreeWorkDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Degree works'
        key :description, 'Returns the created Degree works'
        key :operationId, :create_degree_work
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::DegreeWorks']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :degree_work do
          key :in, :body
          key :description, 'Degree works to register'
          key :required, true
          schema do
            key :'$ref', :DegreeWorkInputPost
          end
        end

        response 201 do
          key :description, 'Degree works response'
          schema do
            key :'$ref', :DegreeWorkOutput
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