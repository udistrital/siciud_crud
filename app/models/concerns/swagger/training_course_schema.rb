
module Swagger::TrainingCourseSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :TrainingCourse do
      property :active do
        key :type, :boolean
        key :default, true
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :date do
        key :type, :string
        key :format, :date
      end
      property :faculty do
        key :type, :string
      end
      property :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_country_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_state_id do
        key :type, :integer
        key :format, :int64
      end
      property :id_administrative_act do
        key :type, :string
      end
      property :institution do
        key :type, :string
      end
      property :num_administrative_act do
        key :type, :string
      end
      property :observation do
        key :type, :string
      end
      property :program_name do
        key :type, :string
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
    end

    swagger_schema :TrainingCourseInputPost do
      allOf do
        schema do
          property :training_course do
            key :'$ref', :TrainingCourse
          end
        end
        schema do
          property :training_course do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :TrainingCourseInputPut do
      allOf do
        schema do
          property :training_course do
            key :'$ref', :TrainingCourse
          end
        end
        schema do
          property :training_course do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :TrainingCourseOutput do
      allOf do
        schema do
          key :'$ref', :TrainingCourse
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :category_name do
            key :type, :string
          end
          property :colciencias_call_name do
            key :type, :string
          end
          property :colciencias_call_year do
            key :type, :integer
            key :format, :int64
          end
          property :geo_city_name do
            key :type, :string
          end
          property :geo_country_name do
            key :type, :string
          end
          property :geo_state_name do
            key :type, :string
          end
          property :created_by do
            key :type, :integer
            key :format, :int64
          end
          property :updated_by do
            key :type, :integer
            key :format, :int64
          end
          property :created_at do
            key :type, :string
            key :format, 'date-time'
          end
          property :updated_at do
            key :type, :string
            key :format, 'date-time'
          end
        end
      end
    end

    swagger_schema :TrainingCourseDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :TrainingCourseOutput
            end
          end
        end
      end
    end
  end
end