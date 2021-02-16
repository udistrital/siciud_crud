module Swagger::ScientificNoteSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ScientificNote do
      key :required, [:id]
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
      property :doi do
        key :type, :string
      end
      property :final_page do
        key :type, :integer
        key :format,:int64
      end
      property :initial_page do
        key :type, :integer
        key :format, :int64
      end
      property :issn do
        key :type, :string
      end
      property :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property :journal_id do
        key :type, :integer
        key :format, :int64
      end
      property :number_of_page do
        key :type, :integer
        key :format, :int64
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

    swagger_schema :ScientificNoteInput do
      property :scientific_note do
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
        property :final_page do
          key :type, :integer
          key :format,:int64
        end
        property :initial_page do
          key :type, :integer
          key :format, :int64
        end
        property :issn do
          key :type, :string
        end
        property :geo_city_id do
          key :type, :integer
          key :format, :int64
        end
        property :journal_id do
          key :type, :integer
          key :format, :int64
        end
        property :number_of_page do
          key :type, :integer
          key :format, :int64
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

    swagger_schema :ScientificNoteOutput do
      allOf do
        schema do
          key :'$ref', :ScientificNote
        end
        schema do
          property :category_name do
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
          property :journal_name do
            key :type, :string
          end
        end
      end
    end

    swagger_schema :ScientificNoteDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ScientificNoteOutput
            end
          end
        end
      end
    end
  end
end