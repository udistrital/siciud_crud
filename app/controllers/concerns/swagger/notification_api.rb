module Swagger::NotificationApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do

    swagger_path '/notifications' do

      operation :post do
        key :summary, 'Health check'
        key :description, 'Notification service health check'
        key :operationId, :health_check
        key :produces, ['application/json',]
        key :tags, ['Notifications']

        parameter name: :notification do
          key :in, :body
          key :description, 'Notification service params'
          key :required, true
          schema do
            property :notification do
              property :to do
                key :type, :array
                items do
                  key :type, :string
                end
              end
              property :cc do
                key :type, :array
                items do
                  key :type, :string
                end
              end
            end
          end
        end

        response 200 do
          key :description, 'notification response'
          schema do
            property :service do
              key :type, :string
            end
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