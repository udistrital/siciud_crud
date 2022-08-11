module Swagger::ItemDetailApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/item_details/{id}' do
      operation :get do
        key :summary, 'Get a item detail by ID'
        key :description, 'Returns a single item detail'
        key :operationId, :get_item_detail_by_id
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Item details']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of item detail to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Item detail response'
          schema do
            key :'$ref', :ItemDetailOutput
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
        key :summary, 'Update item detail by ID'
        key :description, 'Returns the updated item detail'
        key :operationId, :update_item_detail
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Item details']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of item detail to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :item_detail do
          key :in, :body
          key :description, 'Item detail to update'
          key :required, true
          schema do
            key :'$ref', :ItemDetailInputPut
          end
        end

        response 200 do
          key :description, 'Item detail response'
          schema do
            key :'$ref', :ItemDetailOutput
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
        key :summary, 'Activate or deactivate a item detail by ID'
        key :description, 'Returns the activated/deactivated item detail'
        key :operationId, :change_active_item_detail
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Item details']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of item detail to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :item_detail do
          key :in, :body
          key :description, 'Item detail to activate or deactivate'
          key :required, true
          schema do
            property :item_detail do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'Item detail response'
          schema do
            key :'$ref', :ItemDetailOutput
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

    swagger_path '/proposals/{proposal_id}/item_details' do
      operation :get do
        key :summary, 'Get all  item details'
        key :description, 'Returns all item details'
        key :operationId, :get_item_details
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Item details']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Item detail response'
          schema do
            key :'$ref', :ItemDetailDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new item detail'
        key :description, 'Returns the created item detail'
        key :operationId, :create_item_detail
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Item details']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :item_detail do
          key :in, :body
          key :description, 'Item detail to register'
          key :required, true
          schema do
            key :'$ref', :ItemDetailInputPost
          end
        end

        response 201 do
          key :description, 'Item detail response'
          schema do
            key :'$ref', :ItemDetailOutput
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

    swagger_path '/proposal_budgets/{proposal_budget_id}/item_details' do
      operation :get do
        key :summary, 'Get all  item details by proposal budget'
        key :description, 'Returns all item details by proposal budget id'
        key :operationId, :get_item_details_by_proposal_budget
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Item details']

        parameter name: :proposal_budget_id do
          key :in, :path
          key :description, 'ID of proposal budget to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Item detail response'
          schema do
            key :'$ref', :ItemDetailDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end
  end
end