module Api
  module V1
    class DependenciesController < AbstractEntityController
      include Swagger::DependencyApi

      before_action :set_entity, only: [:create]
      before_action :set_dependency, only: [:show, :update]

      # GET /entities/:id/dependencies
      def index
        @dependencies = Dependency.where(
          "entity_id = ?", params[:entity_id]
        )
        @dependencies = DxService.load(@dependencies,
                                       params)
        render json: @dependencies
      end

      # GET /dependencies/1
      def show
        render json: @dependency
      end

      # POST /entities/:id/dependencies
      def create
        @dependency = @entity.dependencies.new(
          dependency_params_to_create)

        if @dependency.save
          render json: @dependency, status: :created
        else
          render json: @dependency.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /dependencies/1
      def update
        if @dependency.update(dependency_params_to_update)
          render json: @dependency
        else
          render json: @dependency.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_dependency
        @dependency = Dependency.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def dependency_params_to_create
        params.require(:dependency).permit(:name,
                                           :active, :created_by)
      end

      def dependency_params_to_update
        params.require(:dependency).permit(:name, :entity_id,
                                           :active, :updated_by)
      end
    end
  end
end