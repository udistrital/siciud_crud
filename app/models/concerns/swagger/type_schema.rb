module Swagger::TypeSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Type do
      property :t_name do
        key :type, :string
      end
      property :t_description do
        key :type, :string
      end
      property :t_parent_id do
        key :type, :integer
        key :format, :int64
      end
    end

    swagger_schema :TypeInputPost do
      allOf do
        schema do
          property :type do
            key :'$ref', :Type
          end
        end
        schema do
          property :type do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :TypeInputPut do
      allOf do
        schema do
          property :type do
            key :'$ref', :Type
          end
        end
        schema do
          property :type do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :TypeOutput do
      allOf do
        schema do
          key :'$ref', :Type
        end
        schema do
          property :id do
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

    swagger_schema :TypeAllDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              property :id do
                key :type, :integer
                key :format, :int64
              end
              property :type_id do
                key :type, :integer
                key :format, :int64
              end
              property :type_name do
                key :type, :string
              end
              property :type_description do
                key :type, :string
              end
              property :type_active do
                key :type, :boolean
              end
              property :parent_id do
                key :type, :integer
                key :format, :int64
              end
              property :parent_name do
                key :type, :string
              end
              property :parent_description do
                key :type, :string
              end
              property :parent_id do
                key :type, :integer
                key :format, :int64
              end
              property :parent_name do
                key :type, :string
              end
              property :parent_description do
                key :type, :string
              end
              property :parent_type_id do
                key :type, :integer
                key :format, :int64
              end
              property :parent_type_name do
                key :type, :string
              end
              property :parent_type_active do
                key :type, :boolean
              end
              property :id do
                key :type, :integer
                key :format, :int64
              end
              property :name do
                key :type, :string
              end
              property :description do
                key :type, :string
              end
              property :active do
                key :type, :boolean
              end
            end
          end
        end
      end
    end

  end
end