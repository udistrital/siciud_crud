module Swagger::PaperSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Paper do
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :title do
        key :type, :string
      end
      property :approval_date do
        key :type, :string
        key :format, :date
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
      property :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property :final_page do
        key :type, :integer
        key :format, :int64
      end
      property :initial_page do
        key :type, :integer
        key :format, :int64
      end
      property :issn do
        key :type, :string
      end
      property :journal_id do
        key :type, :integer
        key :format, :int64
      end
      property :number_of_pages do
        key :type, :integer
        key :format, :int64
      end
      property :observation do
        key :type, :string
      end
      property :paper_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :publication_date do
        key :type, :string
        key :format, :date
      end
      property :research_unit_id do
        key :type, :integer
        key :format, :int64
      end
      property :url do
        key :type, :string
      end
      property :volume do
        key :type, :string
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

    swagger_schema :PaperInput do
      property :paper do
        property :title do
          key :type, :string
        end
        property :approval_date do
          key :type, :string
          key :format, :date
        end
        property :category_id do
          key :type, :integer
          key :format, :int64
        end
        property :doi do
          key :type, :string
        end
        property :geo_city_id do
          key :type, :integer
          key :format, :int64
        end
        property :final_page do
          key :type, :integer
          key :format, :int64
        end
        property :initial_page do
          key :type, :integer
          key :format, :int64
        end
        property :issn do
          key :type, :string
        end
        property :journal_id do
          key :type, :integer
          key :format, :int64
        end
        property :number_of_pages do
          key :type, :integer
          key :format, :int64
        end
        property :observation do
          key :type, :string
        end
        property :paper_type_id do
          key :type, :integer
          key :format, :int64
        end
        property :publication_date do
          key :type, :string
          key :format, :date
        end
        property :research_unit_id do
          key :type, :integer
          key :format, :int64
        end
        property :url do
          key :type, :string
        end
        property :volume do
          key :type, :string
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
      end
    end

    swagger_schema :PaperOutput do
      allOf do
        schema do
          key :'$ref', :Paper
        end
        schema do
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
          property :geo_country_id do
            key :type, :integer
            key :format, :int64
          end
          property :geo_country_name do
            key :type, :string
          end
          property :geo_state_id do
            key :type, :integer
            key :format, :int64
          end
          property :geo_state_name do
            key :type, :string
          end
          property :journal_name do
            key :type, :string
          end
          property :paper_type_name do
            key :type, :string
          end
        end
      end
    end
    swagger_schema :PaperDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :PaperOutput
            end
          end
        end
      end
    end
  end
end