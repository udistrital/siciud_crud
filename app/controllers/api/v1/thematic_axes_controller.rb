module Api
  module V1
    class ThematicAxesController < ApplicationController
      before_action :set_call, only: [:index, :create, :destroy]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        if params.has_key?("call_id")
          @thematic_axis = @call.thematic_axes.order(:id)
        else
          @thematic_axis = ThematicAxis.all.order(:id)
        end
        render json: @thematic_axis, status: :ok
      end

      def create
        if params.has_key?("call_id")
          if  @call.update(thematic_params)
            @call.thematic_axis_ids = (params[:thematic_axis][:thematic_axis_ids]).uniq
            render json: @call.thematic_axes, status: :created
          else
            render json: @thematic_axis.errors, status: :unprocessable_entity
          end
        else
          @thematic_axis = ThematicAxis.new(new_thematic_params)
          if @thematic_axis.save
            render json: @thematic_axis, status: :created
          else
            render json: @thematic_axis.errors, status: :unprocessable_entity
          end
        end
      end

      def destroy
        if params.has_key?("call_id")
          @call.thematic_axes.destroy(ThematicAxis.find(params[:id]))
        end
      end

      private

      def new_thematic_params
        params.require(:thematic_axis).permit(:name)
      end

      def thematic_params
        params.require(:thematic_axis).permit(thematic_axis_ids: [])
      end

      def set_call
        if params.has_key?("call_id")
          @call = Call.find(params[:call_id])
        end
      end
    end
  end
end
