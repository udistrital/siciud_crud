module Swagger::ChapterSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Chapter do
      property :ch_parent_id do
        key :type, :integer
        key :format, :int64
      end
      property :ch_order do
        key :type, :integer
        key :format, :int64
      end
      property :ch_title do
        key :type, :string
      end
      property :ch_description do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ChapterInputPost do
      allOf do
        schema do
          property :chapter do
            key :'$ref', :Chapter
          end
        end
        schema do
          property :chapter do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ChapterInputPut do
      allOf do
        schema do
          property :chapter do
            key :'$ref', :Chapter
          end
        end
        schema do
          property :chapter do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ChapterOutput do
      allOf do
        schema do
          key :'$ref', :Chapter
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :sectionable_type do
            key :type, :string
          end
          property :sectionable_id do
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

    swagger_schema :ChapterDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ChapterOutput
            end
          end
        end
      end
    end
  end
end