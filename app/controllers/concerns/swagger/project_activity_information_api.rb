module Swagger::ProjectActivityInformationApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/notified_activities' do
      operation :put do
        key :summary, 'Update activities as notified'
        key :description, 'Returns the updated activities'
        key :operationId, :update_notified_activities
        key :produces, ['application/json',]
        key :tags, ['Notifications:: Update activities as notified']

        parameter name: :notified_activity do
          key :in, :body
          key :description, 'ids of the activities to update'
          key :required, true
          schema do
            key :'$ref', :NotifiedActivityInput
          end
        end

        response 200 do
          key :description, 'notified activities response'
          schema do
            key :'$ref', :NotifiedActivityOutput
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

    swagger_path '/projects/{proposal_id}/activities_to_expire' do
      operation :get do
        key :summary, 'Gets all activities about to expire and not reported by proposal/project'
        key :description, 'Returns all activities about to expire and not reported by proposal/project'
        key :operationId, :get_activities_2_expire_by_project
        key :produces, ['application/json',]
        key :tags, ['Notifications:: Activities about to expire']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of the proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :delta_days do
          key :in, :query
          key :description, 'interval of days in which the activity ends'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'activity response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CompleteProjectActivityDx
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end

    swagger_path '/projects/{proposal_id}/expired_activities' do
      operation :get do
        key :summary, 'Gets all expired and unreported activities by proposal/project'
        key :description, 'Returns all expired and unreported activities by proposal/project'
        key :operationId, :get_expired_activities_by_project
        key :produces, ['application/json',]
        key :tags, ['Notifications:: Expired Activities']

        parameter name: :proposal_id do
          key :in, :path
          key :description, 'ID of the proposal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'expired activity response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CompleteProjectActivityDx
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end

    swagger_path '/projects/summary' do
      operation :get do
        key :summary, 'Get summary of the proposals/projects'
        key :description, 'Returns the summary of the proposals/projects'
        key :operationId, :get_project_summary
        key :produces, ['application/json',]
        key :tags, ['Notifications:: Project summary']

        response 200 do
          key :description, 'project summary response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ActivityEvaluationNotificationDx
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end
  end
end