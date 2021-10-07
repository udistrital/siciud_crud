module Swagger::ApManagementReportApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/ap_management_reports/{id}' do
      operation :put do
        key :summary, 'Update the action plan management report by ID'
        key :description, 'Return the updated action plan management report'
        key :operationId, :update_ap_management_report
        key :produces, ['application/json',]
        key :tags, ['Research Units::Action Plans']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of action plan to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :ap_management_report do
          key :in, :body
          key :description, 'action plan to update'
          key :required, true
          schema do
            key :'$ref', :ApManagementReportInputPut
          end
        end

        response 200 do
          key :description, 'action plan response'
          schema do
            key :'$ref', :ActionPlanOutput
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