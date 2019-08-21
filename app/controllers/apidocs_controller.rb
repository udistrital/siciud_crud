module Api
  module V1
    class ApidocsController < ApplicationController
      include Swagger::Blocks

      swagger_root do
        key :swagger, "2.0"
        info do
          key :version, "1.0.0"
          key :title, "Users demo API"
          key :description, "A sample users CRUD API"
          contact do
            key :name, "https://github.com/erendira"
          end
        end
        key :host, ENV["HOST"]
        key :basePath, "/"
        key :consumes, ["application/json"]
        key :produces, ["application/json"]
      end

      # A list of all classes that have swagger_* declarations.
      SWAGGERED_CLASSES = [
          Agreement,
        AgreementController,
        CountryController,
        GroupMemberController,
        self,
      ].freeze

      def index
        render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      end
    end
  end
end
