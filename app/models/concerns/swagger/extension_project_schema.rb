module Swagger::ExtensionProjectSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ExtensionProject do
      property :active do
        key :type, :boolean
        key :default, true
      end
      property :administrative_act do
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
      property :community_name do
        key :type, :string
      end
      property :final_date do
        key :type, :string
        key :format, :date
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
      property :institution do
        key :type, :string
      end
      property :name_ext_project do
        key :type, :string
      end
      property :observation do
        key :type, :string
      end
      property :project_name do
        key :type, :string
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :start_date do
        key :type, :string
        key :format, :date
      end
    end

    swagger_schema :ExtensionProjectInputPost do
      allOf do
        schema do
          property :extension_project do
            key :'$ref', :ExtensionProject
          end
        end
        schema do
          property :extension_project do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ExtensionProjectInputPut do
      allOf do
        schema do
          property :extension_project do
            key :'$ref', :ExtensionProject
          end
        end
        schema do
          property :extension_project do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ExtensionProjectOutput do
      allOf do
        schema do
          key :'$ref', :ExtensionProject
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

    swagger_schema :ExtensionProjectDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ExtensionProjectOutput
            end
          end
        end
      end
    end
  end
end