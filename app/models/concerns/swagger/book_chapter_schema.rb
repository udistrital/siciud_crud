module Swagger::BookChapterSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :BookChapter do
      key :required, [:id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :book_title do
        key :type, :string
      end
      property :title do
        key :type, :string
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :doi do
        key :type, :string
      end
      property :editorial_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_city_id do
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
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :url do
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

    swagger_schema :BookChapterInput do
      property :book_chapter do
        property :book_title do
          key :type, :string
        end
        property :title do
          key :type, :string
        end
        property :category_id do
          key :type, :integer
          key :format, :int64
        end
        property :doi do
          key :type, :string
        end
        property :editorial_name do
          key :type, :string
        end
        property :geo_city_id do
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

    swagger_schema :BookChapterOutput do
      allOf do
        schema do
          key :'$ref', :BookChapter
        end
        schema do
          property :category_name do
            key :type, :string
          end
          property :editorial_name do
            key :type, :string
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
        end
      end
    end
  end
end