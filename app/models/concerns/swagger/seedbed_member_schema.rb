module Swagger::SeedbedMemberSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :SeedbedMemberComplete do
      key :required, [:id, :name]
      property :id do
        key :type, :integer
      end
      property :researcher do
        property :id do
          key :type, :integer
        end
        property :codeNumber do
          key :type, :integer
        end
        property :name do
          key :type, :string
        end
        property :lastName do
          key :type, :string
        end
        property :document_type_id do
          key :type, :integer
        end
        property :birthPlace do
          key :type, :string
        end
        property :faculty_id do
          key :type, :integer
        end
        property :curricular_project_id do
          key :type, :integer
        end
        property :snies_id do
          key :type, :integer
        end
        property :researcher_type_id do
          key :type, :integer
        end
        property :orcid_id do
          key :type, :string
        end
      end
      property :role do
        key :type, :string
      end
      property :state_researcher do
        property :id do
          key :type, :integer
        end
        property :name do
          key :type, :string
        end
      end

      property :sm_periods do
        key :type, :array
        items do
          property :id do
            key :type, :string
          end
          property :initialDate do
            key :type, :string
            key :format, :date
          end
          property :finalDate do
            key :type, :string
            key :format, :date
          end
          property :role_id do
            key :type, :integer
          end
          property :roleName do
            key :type, :string
          end
        end
      end
    end

    swagger_schema :SeedbedMemberBase do
      #allOf do
      #schema do
      # key :'$ref', :GroupMember
      # end
      # schema do
      #   key :required, [:name]
      #   property :id do
      #     key :type, :integer
      #     key :format, :int64
      #   end
      # end
      #end
      key :type, :array
      items do
        property :id do
          key :type, :integer
          #key :format, :date
        end
        property :researcher do
          property :name do
            key :type, :string
            #key :format, :date
          end
          property :lastName do
            key :type, :string
            #key :format, :date
          end
        end
        property :role do
          property :id do
            key :type, :integer
            #key :format, :date
          end
          property :name do
            key :type, :string
            #key :format, :date
          end
        end
        property :state_researcher do
          property :id do
            key :type, :integer
            #key :format, :date
          end
          property :name do
            key :type, :string
            #key :format, :date
          end
        end
      end
    end
  end
end
