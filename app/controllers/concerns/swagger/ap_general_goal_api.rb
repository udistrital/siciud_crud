module Swagger::ApGeneralGoalApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path "/api/v1/agreement_research_project/{agreement_research_project_id}/ap_general_goal" do
      operation :get do
        key :description, "Traer el objetivo general de un proyecto de un convenio de investigacion"
        key :operationId, :get_ap_general_goal
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Entidades financiadoras",
            #,
            ]
        parameter name: :funding_entity_id do
          key :in, :path
          key :description, "Funding Entity id"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Lista de contactos de la entidades financiadoras"
          schema do
            key :type, :array
            items do
              key :'$ref', :FeContact
            end
          end
        end
      end
      operation :post do
        key :description, "Agregar un contacto a una entidad finaciadora"
        key :operationId, :create_fe_contact
        key :produces, ["application/json"]
        key :tags, [
              "Entidades financiadoras",
            #,
            ]
        parameter name: :funding_entity_id do
          key :in, :path
          key :description, "Funding Entity id"
          key :required, false
          key :type, :int64
        end
        parameter do
          key :name, :fe_contact
          key :in, :body
          key :description, "Datos del contacto en al entidad financiadora"
          key :required, true
          schema do
            key :'$ref', :FeContactPost
          end
        end
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :FeContact
          end
        end
        response :default do
          key :description, "unexpected error"
        end
      end
    end
    swagger_path "/api/v1/funding_entity/{funding_entity_id}/fe_contact/{id}" do
      operation :get do
        key :description, "Traer el detalle de un contacto de entidad financiadora"
        key :operationId, :get_contact
        key :produces, [
          "application/json",
        ]
        key :tags, [
          "Entidades financiadoras",
        #,
        ]
        parameter name: :funding_entity_id do
          key :in, :path
          key :description, "Funding Entity id"
          key :required, false
          key :type, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, "Contact id"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Informacion del contacto"

          schema do
            key :'$ref', :FeContact
          end
        end
      end
      operation :put do
        key :description, "Traer el detalle de un contacto de entidad financiadora"
        key :operationId, :get_contact
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Entidades financiadoras",
            #,
            ]
        parameter name: :funding_entity_id do
          key :in, :path
          key :description, "Funding Entity id"
          key :required, false
          key :type, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, "Contact id"
          key :required, false
          key :type, :int64
        end
        parameter do
          key :name, :fe_contact
          key :in, :body
          key :description, "Datos del contacto en al entidad financiadora"
          key :required, true
          schema do
            key :'$ref', :FeContactPost
          end
        end
        # definición del success response
        response 200 do
          key :description, "Informacion del contacto"

          schema do
            key :'$ref', :FeContact
          end
        end
      end
    end
  end
end
