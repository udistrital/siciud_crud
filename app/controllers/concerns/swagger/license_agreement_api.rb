module Swagger::LicenseAgreementApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/license_agreements/{id}' do
      operation :get do
        key :summary, 'Get a License Agreement by ID'
        key :description, 'Returns a single License Agreement'
        key :operationId, :get_license_agreement_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::License Agreements']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of License Agreement to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'License Agreement response'
          schema do
            key :'$ref', :LicenseAgreementOutput
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
        key :summary, 'Update License Agreement by ID'
        key :description, 'Returns the updated License Agreement'
        key :operationId, :update_license_agreement
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::License Agreements']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of License Agreement to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :license_agreement do
          key :in, :body
          key :description, 'License Agreement to update'
          key :required, true
          schema do
            key :'$ref', :LicenseAgreementInputPut
          end
        end

        response 200 do
          key :description, 'License Agreement response'
          schema do
            key :'$ref', :LicenseAgreementOutput
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
        key :summary, 'Activate or deactivate a License Agreement by ID'
        key :description, 'Returns the activated/deactivated License Agreement'
        key :operationId, :change_active_license_agreement
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::License Agreements']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of License Agreement to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :license_agreement do
          key :in, :body
          key :description, 'License Agreement to activate or deactivate'
          key :required, true
          schema do
            property :license_agreement do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'License Agreement response'
          schema do
            key :'$ref', :LicenseAgreementOutput
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

    swagger_path '/research_units/{research_group_id}/license_agreements/' do
      operation :get do
        key :summary, 'Get all License Agreements'
        key :description, 'Returns all License Agreements'
        key :operationId, :get_license_agreements
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::License Agreements']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'License Agreement response'
          schema do
            key :type, :array
            items do
              key :'$ref', :LicenseAgreementDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new License Agreements'
        key :description, 'Returns the created License Agreement'
        key :operationId, :create_license_agreement
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::License Agreements']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :license_agreement do
          key :in, :body
          key :description, 'License Agreement to register'
          key :required, true
          schema do
            key :'$ref', :LicenseAgreementInputPost
          end
        end

        response 201 do
          key :description, 'License Agreement response'
          schema do
            key :'$ref', :LicenseAgreementOutput
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