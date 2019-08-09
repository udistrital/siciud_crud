module Api
  module V1
    class ContributionRpItemController < ApplicationController
      before_action :set_agreement_research_project
      before_action :set_contribution_rp_item, only: [:show, :update]

      def index
        #Listar todos los convenios
        @contribution_rp_items = @agreement_research_project.contribution_rp_items
        render json: @contribution_rp_items
      end

      def show
        render json: @contribution_rp_item
      end

      def create
        @contribution_rp_item = @agreement_research_project.contribution_rp_items.new(contribution_rp_item_params)
        if @agreement_research_project.save
          render json: @contribution_rp_item, status: :created
        else
          render json: @contribution_rp_item.errors, status: :unprocessable_entity
        end
      end

      def update
        if @contribution_rp_item.update(contribution_rp_item_params)
          render json: @contribution_rp_item
        else
          render json: @contribution_rp_item.errors, status: :unprocessable_entity
        end
      end

      private

      def set_agreement_research_project
        #@agreement_research_project = @agreement.agreement_research_projects.find_by(id: params[:id])
        @agreement_research_project = AgreementResearchProject.find(params[:agreement_research_project_id])
      end

      def contribution_rp_item_params
        params.require(:contribution_rp_item).permit(:cashValue, :inKindValue, :contribution_id,:item_category_id)
      end

      def set_contribution_rp_item
        @contribution_rp_item = @agreement_research_project.contribution_rp_items.find_by(id: params[:id])
      end
    end
  end
end
