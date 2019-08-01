module Swagger::AgreementSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Agreement do
      key :required, [:id, :name]
      property :agreement do
        property :name do
          key :type, :string
          #key :format, :date
        end
        property :startDate do
          key :type, :string
          key :format, :date
        end
        property :finalDate do
          key :type, :string
          key :format, :date
        end
        property :agreement_status_id do
          key :type, :integer
        end
        property :agreement_type_id do
          key :type, :integer
        end
        property :research_group_ids do
          key :type, :array
          items do
            key :type, :integer
          end
        end
        property :duration do
          key :type, :integer
        end
        property :availability do
          key :type, :integer
        end
        property :bizagiNumber do
          key :type, :integer
        end
        property :description do
          key :type, :string
        end
      end
    end

    swagger_schema :AgreementInput do
      allOf do
        schema do
          key :'$ref', :Agreement
        end
        # schema do
        #   key :required, [:name]
        #   property :id do
        #     key :type, :integer
        #     key :format, :int64
        #   end
        # end
      end
    end
  end
end
