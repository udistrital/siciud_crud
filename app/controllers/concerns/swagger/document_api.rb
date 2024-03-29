module Swagger::DocumentApi
  extend ActiveSupport::Concern
  include Swagger::Blocks
  require './app/models/concerns/constant.rb'

  PRODUCT_ARRAY = get_product_array
  RU_PRODUCT_ARRAY = [:activity_schedules,
                      :calls,
                      :manuals,
                      :mobility_calls,
                      :proposals,
                      :proposal_products,
                      :item_details,
                      :research_units,
                      :research_networks,
                      :form_a_act_plans,
                      :form_b_act_plans,
                      :form_c_act_plans,
                      :form_d_act_plans,
                      :research_groups_research_networks
  ] + PRODUCT_ARRAY
  RU_PRODUCT_ARRAY = RU_PRODUCT_ARRAY.sort

  included do
    swagger_path '/{context}/{context_id}/documents/{id}' do
      operation :get do
        key :summary, 'Get an Document of a Context (Research Units or Products) by ID'
        key :description, 'Returns a single document'
        key :operationId, :get_document_by_id
        key :produces, ['application/json',]
        key :tags, ['Documents']

        parameter name: :context do
          key :in, :path
          key :description, 'Research units, product name or production name to fetch, e. g.,
            research_units, books, papers and patents, among others (see all the names of the production "url names").'
          key :enum, RU_PRODUCT_ARRAY
          key :required, true
          key :type, :string
        end

        parameter name: :context_id do
          key :in, :path
          key :description, 'Research Unit ID, Product ID or production ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of document to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'document response'
          schema do
            key :'$ref', :DocumentOutput
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
        key :summary, 'Update Document of a Research Unit or Product by ID'
        key :description, 'Returns the updated document'
        key :operationId, :update_document
        key :produces, ['application/json',]
        key :tags, ['Documents']

        parameter name: :context do
          key :in, :path
          key :description, 'Research units, product name or production name to fetch, e. g.,
            research_units, books, papers and patents, among others (see all the names of the production "url names").'
          key :enum, RU_PRODUCT_ARRAY
          key :required, true
          key :type, :string
        end

        parameter name: :context_id do
          key :in, :path
          key :description, 'Research Unit ID, Product ID or production ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of document to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :document do
          key :in, :body
          key :description, 'Document to update'
          key :required, true
          schema do
            key :'$ref', :DocumentInputPut
          end
        end

        response 200 do
          key :description, 'document response'
          schema do
            key :'$ref', :DocumentOutput
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

    swagger_path '/{context}/{context_id}/documents' do
      operation :get do
        key :summary, 'Get all Documents of a Research Unit or Product by ID'
        key :description, 'Returns all Documents of a Research Unit or Product by ID'
        key :operationId, :get_documents
        key :produces, ['application/json',]
        key :tags, ['Documents']

        parameter name: :context do
          key :in, :path
          key :description, 'Research units, product name or production name to fetch, e. g.,
            research_units, books, papers and patents, among others (see all the names of the production "url names").'
          key :enum, RU_PRODUCT_ARRAY
          key :required, true
          key :type, :string
        end

        parameter name: :context_id do
          key :in, :path
          key :description, 'Research Unit ID, Product ID or production ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'document response'
          key :'$ref', :DocumentDxOutput
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Document'
        key :description, 'Returns the created document'
        key :operationId, :create_document
        key :produces, ['application/json',]
        key :tags, ['Documents']

        parameter name: :context do
          key :in, :path
          key :description, 'Research units, product name or production name to fetch, e. g.,
            research_units, books, papers and patents, among others (see all the names of the production "url names").'
          key :enum, RU_PRODUCT_ARRAY
          key :required, true
          key :type, :string
        end

        parameter name: :context_id do
          key :in, :path
          key :description, 'Research Unit ID, Product ID or production ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :document do
          key :in, :body
          key :description, 'Document to register'
          key :required, true
          schema do
            key :'$ref', :DocumentInputPost
          end
        end

        response 201 do
          key :description, 'document response'
          schema do
            key :'$ref', :DocumentOutput
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
