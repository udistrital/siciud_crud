module Swagger::ReportApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/reports/{id}' do
      operation :get do
        key :summary, 'Get a Report by ID'
        key :description, 'Returns a single Report'
        key :operationId, :get_report_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Reports']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Report to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'report response'
          schema do
            key :'$ref', :ReportOutput
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
        key :summary, 'Update Report by ID'
        key :description, 'Returns the updated Report'
        key :operationId, :update_report
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Reports']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Report to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :report do
          key :in, :body
          key :description, 'Report to update'
          key :required, true
          schema do
            key :'$ref', :ReportInputPut
          end
        end

        response 200 do
          key :description, 'report response'
          schema do
            key :'$ref', :ReportOutput
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
        key :summary, 'Activate or deactivate a Report by ID'
        key :description, 'Returns the activated/deactivated Report'
        key :operationId, :change_active_report
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Reports']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Report to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :report do
          key :in, :body
          key :description, 'Report to activate or deactivate'
          key :required, true
          schema do
            property :report do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'report response'
          schema do
            key :'$ref', :ReportOutput
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

    swagger_path '/research_units/{research_group_id}/reports' do
      operation :get do
        key :summary, 'Get all Reports'
        key :description, 'Returns all Reports'
        key :operationId, :get_reports
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Reports']

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
          key :description, 'report response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ReportDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Reports'
        key :description, 'Returns the created Report'
        key :operationId, :create_report
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Reports']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :report do
          key :in, :body
          key :description, 'Report to register'
          key :required, true
          schema do
            key :'$ref', :ReportInputPost
          end
        end

        response 201 do
          key :description, 'report response'
          schema do
            key :'$ref', :ReportOutput
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