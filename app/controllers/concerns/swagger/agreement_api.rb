module Swagger::AgreementApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path "/api/v1/agreement/{id}" do
      # GET /agreement/:id
      operation :get do
        key :description, "Obtener un Convenio por ID"
        key :operationId, :get_agreement_by_id
        key :produces, [
          "application/json",
        ]
        key :tags, [
          :Convenios,
        ]
        # definición del parámetro id incluido en el path
        parameter name: :id do
          key :in, :path
          key :description, "Agreement ID"
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        # definición del success response
        response 200 do
          key :description, "Convenios"
          schema do
            key :required, [:id, :name]
            property :id do
              key :type, :integer
              key :format, :int64
            end
            property :name do
              key :type, :string
            end
          end
          schema do
            key :'$ref', :Agreement
          end
        end
      end
      operation :put do
        key :description, "Actualizar un convenio"
        key :operationId, :update_agreement
        key :produces, ["application/json"]
        key :tags, [:Convenios]
        parameter name: :id do
          key :in, :path
          key :description, "Agreement ID"
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter do
          key :name, :agreement
          key :in, :body
          key :description, "Convenio a actualizar"
          key :required, true
          schema do
            key :'$ref', :AgreementInput
          end
        end
        response 200 do
          key :description, "Convenio"
          schema do
            key :'$ref', :Agreement
          end
        end
        response :default do
          key :description, "unexpected error"
        end
      end
    end
    swagger_path "/api/v1/agreement/" do
      operation :get do
        key :description, "Traer todos los convenios paginados "
        key :operationId, :get_agreements
        key :produces, [
              "application/json",
            ]
        key :tags, [
              :Convenios,
            ]
        # definición del success response
        response 200 do
          key :description, "Convenios"

          schema do
            key :'$ref', :Agreement
          end
        end
      end
      operation :post do
        key :description, "Crear un convenio"
        key :operationId, :create_agreement
        key :produces, ["application/json"]
        key :tags, [:Convenios]

        parameter do
          key :name, :agreement
          key :in, :body
          key :description, "Convenio a crear"
          key :required, true
          schema do
            key :'$ref', :AgreementInput
          end
        end
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :Agreement
          end
        end
        response :default do
          key :description, "unexpected error"
        end
      end
    end
  end
end
