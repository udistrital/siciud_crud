module Swagger::GroupMemberApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path "/api/v1/research_group/{research_group_id}/group_member" do
      operation :get do
        key :description, "Traer todos los convenios paginados "
        key :operationId, :get_members
        key :produces, [
              "application/json",
            ]
        key :tags, [
              :Miembros,
            ]
        parameter name: :research_group_id do
          key :in, :path
          key :description, "Research group id"
          key :required, false
          key :type, :int64
        end
        # definición del success response
        response 200 do
          key :description, "Convenios"

          schema do
            #key :'$ref', :Agreement
          end
        end
      end
    end
  end
end
