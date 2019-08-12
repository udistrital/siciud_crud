module Api
  module V1
    class ContributionRpItemController < ApplicationController
      before_action :set_agreement_research_project
      before_action :set_contribution_rp_item, only: [:show, :update]
      before_action :set_contribution_funding_entity_item, only: [:create, :update]

      def index
        #Listar todos los convenios
        @contribution_rp_items = @agreement_research_project.contribution_rp_items
        render json: @contribution_rp_items
      end

      def show
        render json: @contribution_rp_item
      end

      def create
        if (((@contribution_funding_entity_item.contribution_rp_items.sum(:cashValue) + params[:contribution_rp_item][:cashValue]) < @contribution_funding_entity_item.cashValue) &&
            ((@contribution_funding_entity_item.contribution_rp_items.sum(:inKindValue) + params[:contribution_rp_item][:inKindValue]) < @contribution_funding_entity_item.inKindValue))
          @contribution_rp_item = @agreement_research_project.contribution_rp_items.new(contribution_rp_item_params)
        else
          return render json: { "error": "No se puede asignar mas del presupuesto asignado" }, status: :not_acceptable
        end

        if @agreement_research_project.save
          render json: @contribution_rp_item, status: :created
        else
          render json: @contribution_rp_item.errors, status: :unprocessable_entity
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
          return render json: { "error": "No se puede asignar mas del presupuesto asignado" }, status: :not_acceptable
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
