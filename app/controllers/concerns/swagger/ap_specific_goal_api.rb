module Swagger::ApSpecificGoalApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path "/api/v1/ap_general_goal/{ap_general_goal_id}/ap_specific_goal" do
      operation :get do
        key :description, "Traer el objetivo especifico del objetivo general de un proyecto de un convenio de investigacion"
        key :operationId, :get_ap_specific_goal
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Objetivos de proyectos de investigacion",
            #,
            ]
        parameter name: :ap_general_goal_id do
          key :in, :path
          key :description, "AP General Goal ID"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Lista de contactos de la entidades financiadoras"
          schema do
            key :type, :array
            items do
              key :'$ref', :ApSpecificGoal
            end
          end
        end
      end
      operation :post do
        key :description, "Crear un objetivo especifico del objetivo general de un proyecto de un convenio de investigacion"
        key :operationId, :create_fe_contact
        key :produces, ["application/json"]
        key :tags, [
              "Objetivos de proyectos de investigacion",
            #,
            ]
        parameter name: :ap_general_goal_id do
          key :in, :path
          key :description, "AP General Goal ID"
          key :required, false
          key :type, :int64
        end
        parameter do
          key :name, :ap_specific_goal
          key :in, :body
          key :description, "Objetivo Especifico"
          key :required, true
          schema do
            key :'$ref', :ApSpecificGoalPost
          end
        end
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :ApSpecificGoal
          end
        end
        response :default do
          key :description, "unexpected error"
        end
      end
    end
    swagger_path "/api/v1/ap_general_goal/{ap_general_goal_id}/ap_specific_goal/{id}" do
      operation :get do
        key :description, "Ver un objetivo especifico"
        key :operationId, :get_contact
        key :produces, [
          "application/json",
        ]
        key :tags, [
          "Objetivos de proyectos de investigacion",
        #,
        ]
        parameter name: :ap_general_goal_id do
          key :in, :path
          key :description, "AP General Goal ID"
          key :required, false
          key :type, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, "Ap Specific Goal id"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :ApSpecificGoal
          end
        end
      end
      operation :put do
        key :description, "Actualizar el objetivo especifico"
        key :operationId, :get_contact
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Objetivos de proyectos de investigacion",
            #,
            ]
        parameter name: :ap_general_goal_id do
          key :in, :path
          key :description, "AP General Goal ID"
          key :required, false
          key :type, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, "Ap Specific Goal id"
          key :required, false
          key :type, :int64
        end
        parameter do
          key :name, :ap_specific_goal
          key :in, :body
          key :description, "Objetivo especifico"
          key :required, true
          schema do
            key :'$ref', :ApSpecificGoalPost
          end
        end
        # definición del success response
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :ApSpecificGoal
          end
        end
      end
    end
  end
end
