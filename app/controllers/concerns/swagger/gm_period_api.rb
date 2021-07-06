module Swagger::GmPeriodApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/gm_periods/{id}' do
      operation :get do
        key :summary, 'Get a Group Member Period by ID'
        key :description, 'Returns a single Group Member Period'
        key :operationId, :get_gm_period_by_id
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Member Periods']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Group Member Period to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'group member period response'
          schema do
            key :'$ref', :GmPeriodOutput
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
        key :summary, 'Update Group Member Period by ID'
        key :description, 'Returns the updated Group Member Period'
        key :operationId, :update_gm_period
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Member Periods']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Group Member Period to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :gm_period do
          key :in, :body
          key :description, 'Group Member Period to update'
          key :required, true
          schema do
            key :'$ref', :GmPeriodInputPut
          end
        end

        response 200 do
          key :description, 'group member period response'
          schema do
            key :'$ref', :GmPeriodOutput
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
        key :summary, 'Activate or deactivate a Group Member Period by ID'
        key :description, 'Returns the activated/deactivated Group Member Period'
        key :operationId, :change_active_gm_period
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Member Periods']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Group Member Period to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :gm_period do
          key :in, :body
          key :description, 'Group Member Period to activate or deactivate'
          key :required, true
          schema do
            property :gm_period do
              property :is_current do
                key :type, :boolean
                key :default, false
              end
              property :active do
                key :type, :boolean
                key :default, false
              end
              property :updated_by do
                key :type, :integer
                key :format, :int64
              end
            end
          end
        end

        response 200 do
          key :description, 'group member period response'
          schema do
            key :'$ref', :GmPeriodOutput
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

    swagger_path '/group_member/{group_member_id}/gm_periods' do
      operation :get do
        key :summary, 'Get all Group Member Periods'
        key :description, 'Returns all Group Member Periods'
        key :operationId, :get_gm_periods
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Member Periods']

        parameter name: :group_member_id do
          key :in, :path
          key :description, 'ID of group member to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :requireTotalCount do
          key :in, :query
          key :description, 'If this is "true" added the key "totalCount" with the total number of records found'
          key :required, false
          key :type, :boolean
        end

        response 200 do
          key :description, 'group member period response'
          schema do
            key :type, :array
            items do
              key :'$ref', :GmPeriodDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Group Member Periods'
        key :description, 'Returns the created Group Member Period'
        key :operationId, :create_gm_period
        key :produces, ['application/json',]
        key :tags, ['Research Units::Group Member Periods']

        parameter name: :group_member_id do
          key :in, :path
          key :description, 'ID of group member to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :gm_period do
          key :in, :body
          key :description, 'Group Member Period to register'
          key :required, true
          schema do
            key :'$ref', :GmPeriodInputPost
          end
        end

        response 201 do
          key :description, 'group member period response'
          schema do
            key :'$ref', :GmPeriodOutput
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