module Api
  module V1
    class ContributionRpItemController < ApplicationController
      before_action :set_agreement_research_project
      before_action :set_contribution_rp_item, only: [:show, :update]
      before_action :set_contribution_funding_entity_item, only: [:create, :update]

      rescue_from Exception do |e|
        render json: {error: e.message}, status: :internal_error
      end
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        #Listar todos los convenios
        @contribution_rp_items = @agreement_research_project.contribution_rp_items.order(:created_at)
        render json: @contribution_rp_items
      end

      def show
        render json: @contribution_rp_item
      end

      def create
        #byebug
        if (@contribution_rp_item = @agreement_research_project.contribution_rp_items.find_by(contribution_funding_entity_item_id: params[:contribution_rp_item][:contribution_funding_entity_item_id]))
          return render json: {"error": "No se puede asignar dos veces dinero del mismo tipo de rubro"}, status: :not_acceptable
        else

          if (((@contribution_funding_entity_item.contribution_rp_items.sum(:cashValue) + params[:contribution_rp_item][:cashValue]) <= @contribution_funding_entity_item.cashValue) &&
              ((@contribution_funding_entity_item.contribution_rp_items.sum(:inKindValue) + params[:contribution_rp_item][:inKindValue]) <= @contribution_funding_entity_item.inKindValue))
            @contribution_rp_item = @agreement_research_project.contribution_rp_items.new(contribution_rp_item_params)
            @contribution_rp_item.executedCash = 0
            @contribution_rp_item.executedInKind = 0
            @contribution_rp_item.remainingCash = @contribution_rp_item.cashValue
            @contribution_rp_item.remainingInKind = @contribution_rp_item.inKindValue
            @contribution_rp_item.compromisedCash = 0
            @contribution_rp_item.compromisedInKind = 0
          else
            return render json: {"error": "No se puede asignar mas del presupuesto asignado"}, status: :not_acceptable
          end

          if @contribution_rp_item.save
            render json: @contribution_rp_item, status: :created
          else
            render json: @contribution_rp_item.errors, status: :unprocessable_entity
          end
        end
      end

      def update
        diferenceCashValue = params[:contribution_rp_item][:cashValue] - @contribution_rp_item.cashValue
        diferenceInKindValue = params[:contribution_rp_item][:inKindValue] - @contribution_rp_item.inKindValue
        if (((@contribution_funding_entity_item.contribution_rp_items.sum(:cashValue) + diferenceCashValue) <= @contribution_funding_entity_item.cashValue) &&
            ((@contribution_funding_entity_item.contribution_rp_items.sum(:inKindValue) + diferenceInKindValue) <= @contribution_funding_entity_item.inKindValue))
          if @contribution_rp_item.update(contribution_rp_item_params)
            render json: @contribution_rp_item
          else
            render json: @contribution_rp_item.errors, status: :unprocessable_entity
          end
        else
          return render json: {"error": "No se puede asignar mas del presupuesto asignado"}, status: :not_acceptable
        end
      end

      private

      def set_agreement_research_project
        #@agreement_research_project = @agreement.agreement_research_projects.find_by(id: params[:id])
        @agreement_research_project = AgreementResearchProject.find(params[:agreement_research_project_id])
      end

      def set_contribution_funding_entity_item
        @contribution_funding_entity_item = ContributionFundingEntityItem.find(params[:contribution_rp_item][:contribution_funding_entity_item_id])
      end

      def contribution_rp_item_params
        params.require(:contribution_rp_item).permit(:cashValue, :inKindValue, :contribution_funding_entity_item_id)
      end

      def set_contribution_rp_item
        @contribution_rp_item = @agreement_research_project.contribution_rp_items.find_by(id: params[:id])
      end
    end
  end
end
