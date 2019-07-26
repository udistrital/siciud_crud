module Api
  module V1
    class ContributionController < ApplicationController
      #include Swagger::Docs::ImpotentMethods
      before_action :set_agreement
      before_action :set_contribution, only: [:show, :update, :destroy]

      # swagger_controller :contributions, "Contribution"

      # swagger_api :index do
      #   summary "Fetches all contributions"
      #   param :path, :id, :integer, :required, "Contribution ID"
      #   response :unauthorized
      #   response :not_acceptable
      # end

      # swagger_api :create do
      #   summary "Creates a new User"
      #   param :form, :first_name, :string, :required, "First name"
      #   param :form, :last_name, :string, :required, "Last name"
      #   param :form, :email, :string, :required, "Email address"
      #   param_list :form, :role, :string, :required, "Role", ["admin", "superadmin", "user"]
      #   response :unauthorized
      #   response :not_acceptable
      # end

      def index
        @contributions = @agreement.contributions
        render json: @contributions
      end

      def show
        render json: @contribution
      end

      def create
        @contribution = @agreement.contributions.new(contribution_params)

        if @contribution.save
          render json: @contribution, status: :created
        else
          render json: @contribution.errors, status: :unprocessable_entity
        end
      end

      def update
        if @contribution.update(contribution_params)
          render json: @contribution
        else
          render json: @contribution.errors, status: :unprocessable_entity
        end
      end

      private

      def set_contribution
        @contribution = @agreement.contributions.find_by(id: params[:id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def contribution_params
        params.require(:contribution).permit(:inKindContribution, :cashContribution, :funding_entity_id)
      end

      def set_agreement
        @agreement = Agreement.find(params[:agreement_id])
      end
    end
  end
end
