module Swagger::BookSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Book do
      property :title do
        key :type, :string
      end
      property :book_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :editorial_name do
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
      property :isbn do
        key :type, :string
      end
      property :observation do
        key :type, :string
      end
      property :publication_date do
        key :type, :string
        key :format, :date
      end
      property :url do
        key :type, :string
      end
    end

    swagger_schema :BookInputPost do
      allOf do
        schema do
          property :book do
            key :'$ref', :Book
          end
        end
        schema do
          property :book do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :BookInputPut do
      allOf do
        schema do
          property :book do
            key :'$ref', :Book
          end
        end
        schema do
          property :book do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :BookOutput do
      allOf do
        schema do
          key :'$ref', :Book
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :book_type_name do
            key :type, :string
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
          property :research_group_id do
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

    swagger_schema :BookDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :BookOutput
            end
          end
        end
      end
    end
  end
end