module Swagger::ApActivityApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path "/api/v1/ap_specific_goal/{ap_specific_goal_id}/ap_activity" do
      operation :get do
        key :description, "Traer las actividades del objetivo Especifico de un proyecto de un convenio de investigacion"
        key :operationId, :get_ap_activity
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Objetivos de proyectos de investigacion",
            #,
            ]
        parameter name: :ap_specific_goal_id do
          key :in, :path
          key :description, "AP Specific Goal ID"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Lista de acividades"
          schema do
            key :type, :array
            items do
              key :'$ref', :ApActivity
            end
          end
        end
      end
      operation :post do
        key :description, "Crear una actividad del objetivo Especifico de un proyecto de un convenio de investigacion"
        key :operationId, :create_fe_contact
        key :produces, ["application/json"]
        key :tags, [
              "Objetivos de proyectos de investigacion",
            #,
            ]
        parameter name: :ap_specific_goal_id do
          key :in, :path
          key :description, "AP Especifico Goal ID"
          key :required, false
          key :type, :int64
        end
        parameter do
          key :name, :ap_activity
          key :in, :body
          key :description, "Actividad"
          key :required, true
          schema do
            key :'$ref', :ApActivityPost
          end
        end
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :ApActivity
          end
        end
        response :default do
          key :description, "unexpected error"
        end
      end
    end
    swagger_path "/api/v1/ap_specific_goal/{ap_specific_goal_id}/ap_activity/{id}" do
      operation :get do
        key :description, "Ver un actividad de un objetivo especifico"
        key :operationId, :get_contact
        key :produces, [
          "application/json",
        ]
        key :tags, [
          "Objetivos de proyectos de investigacion",
        #,
        ]
        parameter name: :ap_specific_goal_id do
          key :in, :path
          key :description, "AP Specific Goal ID"
          key :required, false
          key :type, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, "Ap Activity id"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :ApActivity
          end
        end
      end
      operation :put do
        key :description, "Actualizar actividad del objetivo especifico"
        key :operationId, :get_contact
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Objetivos de proyectos de investigacion",
            #,
            ]
        parameter name: :ap_specific_goal_id do
          key :in, :path
          key :description, "AP Especifico Goal ID"
          key :required, false
          key :type, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, "Ap Activity id"
          key :required, false
          key :type, :int64
        end
        parameter do
          key :name, :ap_activity
          key :in, :body
          key :description, "Actividad"
          key :required, true
          schema do
            key :'$ref', :ApActivityPost
          end
        end
        # definición del success response
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :ApActivity
          end
        end
      end
    end
  end
end
