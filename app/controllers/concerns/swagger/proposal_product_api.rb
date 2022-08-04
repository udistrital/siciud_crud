module Swagger::ProposalProductApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/proposal_products/{id}' do
      operation :get do
        key :summary, 'Get a proposal product by ID'
        key :description, 'Returns a single proposal product'
        key :operationId, :get_proposal_product_by_id
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Proposal products']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of proposal product to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'proposal product response'
          schema do
            key :'$ref', :ProposalProductOutput
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
        key :summary, 'Update proposal product by ID'
        key :description, 'Returns the updated proposal product'
        key :operationId, :update_proposal_product
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Proposal products']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of proposal product to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :proposal_product do
          key :in, :body
          key :description, 'Proposal product to update'
          key :required, true
          schema do
            key :'$ref', :ProposalProductInputPut
          end
        end

        response 200 do
          key :description, 'proposal product response'
          schema do
            key :'$ref', :ProposalProductOutput
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
        key :summary, 'Activate or deactivate a proposal product by ID'
        key :description, 'Returns the activated/deactivated proposal product'
        key :operationId, :change_active_proposal_product
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Proposal products']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of proposal product to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :proposal_product do
          key :in, :body
          key :description, 'Proposal product to activate or deactivate'
          key :required, true
          schema do
            property :proposal_product do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'proposal product response'
          schema do
            key :'$ref', :ProposalProductOutput
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

    swagger_path '/proposals/{proposal_id}/proposal_products' do
      operation :get do
        key :summary, 'Get all  proposal products'
        key :description, 'Returns all proposal products'
        key :operationId, :get_proposal_products
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Proposal products']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'proposal product response'
          schema do
            key :'$ref', :ProposalProductDxOutput
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new proposal product'
        key :description, 'Returns the created proposal product'
        key :operationId, :create_proposal_product
        key :produces, ['application/json',]
        key :tags, ['Proposals:: Proposal products']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :proposal_product do
          key :in, :body
          key :description, 'Proposal product to register'
          key :required, true
          schema do
            key :'$ref', :ProposalProductInputPost
          end
        end

        response 201 do
          key :description, 'proposal product response'
          schema do
            key :'$ref', :ProposalProductOutput
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