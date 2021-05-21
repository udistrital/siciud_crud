module Swagger::DistinctiveSignSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :DistinctiveSign do
      property :registration_title do
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
      property :date_of_obtaining do
        key :type, :string
        key :format, :date
      end
      property :registration_number do
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
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :observation do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :DistinctiveSignInputPost do
      allOf do
        schema do
          property :distinctive_sign do
            key :'$ref', :DistinctiveSign
          end
        end
        schema do
          property :distinctive_sign do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :DistinctiveSignInputPut do
      allOf do
        schema do
          property :distinctive_sign do
            key :'$ref', :DistinctiveSign
          end
        end
        schema do
          property :distinctive_sign do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :DistinctiveSignOutput do
      allOf do
        schema do
          key :'$ref', :DistinctiveSign
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

    swagger_schema :DistinctiveSignDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :DistinctiveSignOutput
            end
          end
        end
      end
    end
  end
end