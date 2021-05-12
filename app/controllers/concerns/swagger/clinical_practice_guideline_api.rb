module Swagger::ClinicalPracticeGuidelineApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/clinical_practice_guidelines/{id}' do
      operation :get do
        key :summary, 'Get a Clinical Practice Guideline by ID'
        key :description, 'Returns a single Clinical Practice Guideline'
        key :operationId, :get_clinical_practice_guideline_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Clinical Practice Guidelines']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Clinical Practice Guideline to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Clinical practice guideline response'
          schema do
            key :'$ref', :ClinicalPracticeGuidelineOutput
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
        key :summary, 'Update Clinical Practice Guideline by ID'
        key :description, 'Returns the updated Clinical Practice Guideline'
        key :operationId, :update_clinical_practice_guideline
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Clinical Practice Guidelines']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Clinical Practice Guideline to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :clinical_practice_guideline do
          key :in, :body
          key :description, 'Clinical Practice Guideline to update'
          key :required, true
          schema do
            key :'$ref', :ClinicalPracticeGuidelineInputPut
          end
        end

        response 200 do
          key :description, 'Clinical practice guideline response'
          schema do
            key :'$ref', :ClinicalPracticeGuidelineOutput
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
        key :summary, 'Activate or deactivate a Clinical Practice Guideline by ID'
        key :description, 'Returns the activated/deactivated Clinical Practice Guideline'
        key :operationId, :change_active_clinical_practice_guideline
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Clinical Practice Guidelines']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Clinical Practice Guideline to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :clinical_practice_guideline do
          key :in, :body
          key :description, 'Clinical Practice Guideline to activate or deactivate'
          key :required, true
          schema do
            property :clinical_practice_guideline do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'Clinical practice guideline response'
          schema do
            key :'$ref', :ClinicalPracticeGuidelineOutput
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

    swagger_path '/research_units/{research_group_id}/clinical_practice_guidelines/' do
      operation :get do
        key :summary, 'Get all Clinical Practice Guidelines'
        key :description, 'Returns all Clinical Practice Guidelines'
        key :operationId, :get_clinical_practice_guidelines
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Clinical Practice Guidelines']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Clinical practice guideline response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ClinicalPracticeGuidelineDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Clinical Practice Guidelines'
        key :description, 'Returns the created Clinical Practice Guideline'
        key :operationId, :create_clinical_practice_guideline
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Clinical Practice Guidelines']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :clinical_practice_guideline do
          key :in, :body
          key :description, 'Clinical Practice Guideline to register'
          key :required, true
          schema do
            key :'$ref', :ClinicalPracticeGuidelineInputPost
          end
        end

        response 201 do
          key :description, 'Clinical practice guideline response'
          schema do
            key :'$ref', :ClinicalPracticeGuidelineOutput
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