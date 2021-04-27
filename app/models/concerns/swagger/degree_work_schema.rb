module Swagger::DegreeWorkSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :DegreeWork do
      property :dw_title do
        key :type, :string
      end
      property :dw_date do
        key :type, :string
        key :format, :date
      end
      property :dw_institution_name do
        key :type, :string
      end
      property :dw_recognition do
        key :type, :string
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :observation do
        key :type, :string
      end
      property :dw_type_id do
        key :type, :integer
        key :format, :int64
      end
    end

      swagger_schema :DegreeWorkInputPost do
        allOf do
          schema do
            property :degree_work do
              key :'$ref', :DegreeWork
            end
          end
          schema do
            property :degree_work do
              property :created_by do
                key :type, :integer
                key :format, :int64
              end
            end
          end
        end
      end

      swagger_schema :DegreeWorkInputPut do
        allOf do
          schema do
            property :degree_work do
              key :'$ref', :DegreeWork
            end
          end
          schema do
            property :degree_work do
              property :updated_by do
                key :type, :integer
                key :format, :int64
              end
            end
          end
        end
      end

      swagger_schema :DegreeWorkOutput do
        allOf do
          schema do
            key :'$ref', :DegreeWork
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
            property :active do
              key :type, :boolean
              key :default, true
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

      swagger_schema :DegreeWorkDxOutput do
        allOf do
          schema do
            property :data do
              key :type, :array
              items do
                key :'$ref', :DegreeWorkOutput
              end
            end
          end
        end
      end
    end
  end