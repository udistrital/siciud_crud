module Swagger::ResearchCreationWorkSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ResearchCreationWork do
      key :required, [:id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :title do
        key :type, :string
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :creation_and_selection_date do
        key :type, :string
        key :format, :date
      end
      property :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property :knwl_spec_area_id do
        key :type, :integer
        key :format, :int64
      end
      property :nature_of_work do
        key :type, :string
      end
      property :observation do
        key :type, :string
      end
      property :registered_project_title do
        key :type, :string
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

    swagger_schema :ResearchCreationWorkInput do
      property :research_creation_work do
        property :title do
          key :type, :string
        end
        property :category_id do
          key :type, :integer
          key :format, :int64
        end
        property :creation_and_selection_date do
          key :type, :string
          key :format, :date
        end
        property :geo_city_id do
          key :type, :integer
          key :format, :int64
        end
        property :knwl_spec_area_id do
          key :type, :integer
          key :format, :int64
        end
        property :nature_of_work do
          key :type, :string
        end
        property :observation do
          key :type, :string
        end
        property :registered_project_title do
          key :type, :string
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
      end
    end

    swagger_schema :ResearchCreationWorkOutput do
      allOf do
        schema do
          key :'$ref', :ResearchCreationWork
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
          property :knwl_spec_area_name do
            key :type, :string
          end
        end
      end
    end

    swagger_schema :ResearchCreationWorkDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ResearchCreationWorkOutput
            end
          end
        end
      end
    end
  end
end