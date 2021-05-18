module Swagger::WorkingPaperSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :WorkingPaper do
      property :title do
        key :type, :string
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :doi do
        key :type, :string
      end
      property :elaboration_date do
        key :type, :string
        key :format, :date
      end
      property :related_institution do
        key :type, :string
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :observation do
        key :type, :string
      end
      property :web_page do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :WorkingPaperInputPost do
      allOf do
        schema do
          property :working_paper do
            key :'$ref', :WorkingPaper
          end
        end
        schema do
          property :working_paper do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :WorkingPaperInputPut do
      allOf do
        schema do
          property :working_paper do
            key :'$ref', :WorkingPaper
          end
        end
        schema do
          property :working_paper do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :WorkingPaperOutput do
      allOf do
        schema do
          key :'$ref', :WorkingPaper
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

    swagger_schema :WorkingPaperDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :WorkingPaperOutput
            end
          end
        end
      end
    end
  end
end