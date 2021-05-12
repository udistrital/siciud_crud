module Swagger::BillApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/bills/{id}' do
      operation :get do
        key :summary, 'Get a Bill by ID'
        key :description, 'Returns a single Bill'
        key :operationId, :get_bill_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Bills']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Bill to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'bill response'
          schema do
            key :'$ref', :BillOutput
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
        key :summary, 'Update Bill by ID'
        key :description, 'Returns the updated Bill'
        key :operationId, :update_bill
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Bills']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Bill to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :bill do
          key :in, :body
          key :description, 'Bill to update'
          key :required, true
          schema do
            key :'$ref', :BillInputPut
          end
        end

        response 200 do
          key :description, 'bill response'
          schema do
            key :'$ref', :BillOutput
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
        key :summary, 'Activate or deactivate a Bill by ID'
        key :description, 'Returns the activated/deactivated Bill'
        key :operationId, :change_active_bill
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Bills']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Bill to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :bill do
          key :in, :body
          key :description, 'Bill to activate or deactivate'
          key :required, true
          schema do
            property :bill do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'bill response'
          schema do
            key :'$ref', :BillOutput
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

    swagger_path '/research_units/{research_group_id}/bills/' do
      operation :get do
        key :summary, 'Get all Bills'
        key :description, 'Returns all Bills'
        key :operationId, :get_bills
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Bills']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'bill response'
          schema do
            key :type, :array
            items do
              key :'$ref', :BillDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Bills'
        key :description, 'Returns the created Bill'
        key :operationId, :create_bill
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Bills']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :bill do
          key :in, :body
          key :description, 'Bill to register'
          key :required, true
          schema do
            key :'$ref', :BillInputPost
          end
        end

        response 201 do
          key :description, 'bill response'
          schema do
            key :'$ref', :BillOutput
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