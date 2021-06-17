module Swagger::TrainingCourseApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/training_courses/{id}' do
      operation :get do
        key :summary, 'Get a training course by ID'
        key :description, 'Returns a single training course'
        key :operationId, :get_training_course_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Training Courses']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of training course to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'training course response'
          schema do
            key :'$ref', :TrainingCourseOutput
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
        key :summary, 'Update training course by ID'
        key :description, 'Returns the updated training course'
        key :operationId, :update_training_course
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Training Courses']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of training course to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :training_course do
          key :in, :body
          key :description, 'training course to update'
          key :required, true
          schema do
            key :'$ref', :TrainingCourseInputPut
          end
        end

        response 200 do
          key :description, 'training course response'
          schema do
            key :'$ref', :TrainingCourseOutput
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
        key :summary, 'Activate or deactivate a training course by ID'
        key :description, 'Returns the activated/deactivated training course'
        key :operationId, :change_active_training_course
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Training Courses']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of training course to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :training_course do
          key :in, :body
          key :description, 'training course to activate or deactivate'
          key :required, true
          schema do
            property :training_course do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'training course response'
          schema do
            key :'$ref', :TrainingCourseOutput
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

    swagger_path '/research_units/{research_group_id}/training_courses' do
      operation :get do
        key :summary, 'Get all Training Courses'
        key :description, 'Returns all training courses'
        key :operationId, :get_training_courses
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Training Courses']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'training course response'
          schema do
            key :type, :array
            items do
              key :'$ref', :TrainingCourseDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Training Courses'
        key :description, 'Returns the created training course'
        key :operationId, :create_training_course
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Training Courses']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :training_course do
          key :in, :body
          key :description, 'training course to register'
          key :required, true
          schema do
            key :'$ref', :TrainingCourseInputPost
          end
        end

        response 201 do
          key :description, 'training course response'
          schema do
            key :'$ref', :TrainingCourseOutput
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