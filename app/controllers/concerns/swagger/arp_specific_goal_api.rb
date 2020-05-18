module Swagger::ArpSpecificGoalApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path "/api/v1/arp_general_goal/{arp_general_goal_id}/arp_specific_goal" do
      operation :get do
        key :description, "Traer el objetivo especifico del objetivo general de un proyecto de un convenio de investigacion"
        key :operationId, :get_arp_specific_goal
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Objetivos de proyectos de investigacion",
            #,
            ]
        parameter name: :arp_general_goal_id do
          key :in, :path
          key :description, "ARP General Goal ID"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Lista de contactos de la entidades financiadoras"
          schema do
            key :type, :array
            items do
              key :'$ref', :ArpSpecificGoal
            end
          end
        end
      end
      operation :post do
        key :description, "Crear un objetivo especifico del objetivo general de un proyecto de un convenio de investigacion"
        key :operationId, :create_arp_specific_goal
        key :produces, ["application/json"]
        key :tags, [
              "Objetivos de proyectos de investigacion",
            #,
            ]
        parameter name: :arp_general_goal_id do
          key :in, :path
          key :description, "Apr General Goal ID"
          key :required, false
          key :type, :int64
        end
        parameter do
          key :name, :arp_specific_goal
          key :in, :body
          key :description, "Objetivo Especifico"
          key :required, true
          schema do
            key :'$ref', :ArpSpecificGoalPost
          end
        end
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :ArpSpecificGoal
          end
        end
        response :default do
          key :description, "unexpected error"
        end
      end
    end
    swagger_path "/api/v1/arp_general_goal/{arp_general_goal_id}/arp_specific_goal/{id}" do
      operation :get do
        key :description, "Ver un objetivo especifico"
        key :operationId, :get_arp_specific_goal
        key :produces, [
          "application/json",
        ]
        key :tags, [
          "Objetivos de proyectos de investigacion",
        #,
        ]
        parameter name: :arp_general_goal_id do
          key :in, :path
          key :description, "Apr General Goal ID"
          key :required, false
          key :type, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, "Apr Specific Goal id"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :ArpSpecificGoal
          end
        end
      end
      operation :put do
        key :description, "Actualizar el objetivo especifico"
        key :operationId, :put_arp_specific_goal
        key :produces, [
              "application/json",
            ]
        key :tags, [
              "Objetivos de proyectos de investigacion",
            #,
            ]
        parameter name: :arp_general_goal_id do
          key :in, :path
          key :description, "Apr General Goal ID"
          key :required, false
          key :type, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, "Apr Specific Goal id"
          key :required, false
          key :type, :int64
        end
        parameter do
          key :name, :arp_specific_goal
          key :in, :body
          key :description, "Objetivo especifico"
          key :required, true
          schema do
            key :'$ref', :ArpSpecificGoalPost
          end
        end
        # definición del success response
        response 200 do
          key :description, "Respuesta"
          schema do
            key :'$ref', :ArpSpecificGoal
          end
        end
      end
    end
  end
end
