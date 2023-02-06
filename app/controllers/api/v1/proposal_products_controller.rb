module Api
  module V1
    class ProposalProductsController < AbstractProposalController
      include Swagger::ProposalProductApi

      before_action :set_proposal, only: [:create]
      before_action :set_proposal_product, only: [:show, :update]

      # GET /proposal/:proposal_id/proposal_products
      def index
        if params[:proposal_id]
          @proposal_products = CompleteProposalProduct.where(
            "proposal_id = ?", params[:proposal_id]
          )
        else
          @proposal_products = CompleteProposalProduct.all
        end
        @proposal_products = DxService.load(@proposal_products, params)

        render json: @proposal_products
      end

      # GET /proposal_products/1
      def show
        render json: @proposal_product
      end

      # POST /proposal_products
      def create
        @proposal_product = @proposal.proposal_products.new(
          prop_product_params_to_create.except(:researcher_ids))

        if @proposal_product.save
          save_researchers(@proposal_product, :created)
        else
          render json: @proposal_product.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /proposal_products/1
      def update
        if @proposal_product.update(prop_product_params_to_update.except(:researcher_ids))
          save_researchers(@proposal_product, :ok)
        else
          render json: @proposal_product.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_proposal_product
        @proposal_product = ProposalProduct.find(params[:id])
      end

      def save_researchers(proposal_product, status_c)
        if params[:proposal_product].has_key?(:researcher_ids)
          proposal_product.researcher_ids = (params[:proposal_product][:researcher_ids]).map(&:to_i).uniq
          render json: @proposal_product, status: status_c
        else
          render json: @proposal_product, status: status_c
        end
      end

      # Only allow a trusted parameter "white list" through.
      def prop_product_params_to_create
        params.require(:proposal_product).permit(:name, :product_type_id, :indicator_id,
                                                 :validated, :beneficiary, :active, :created_by,
                                                 researcher_ids: [])
      end

      def prop_product_params_to_update
        params.require(:proposal_product).permit(:name, :product_type_id, :indicator_id,
                                                 :validated, :beneficiary, :proposal_id,
                                                 :active, :updated_by,
                                                 researcher_ids: [])
      end
    end
  end
end