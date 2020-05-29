module Api
  module V1
    class CallItemCallsController < ApplicationController
      before_action :set_call

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
      end

      def create
        @call_item_call = @call.call_item_calls.new(call_item_params)

        if @call_item_call.valid?
          validate_percentage = CallItemCallsSearchService.validate_pct_less_than_maximum_pct(
              @call_item_call.percentage,
              @call_item_call.maximum_percentage)

          if validate_percentage
            # Validate add percentage not exceeding 100 %
            total_percentage = CallItemCallsSearchService.count_total_percentage(
                @call.call_item_calls, @call_item_call.percentage)

            if total_percentage <= 100
              if @call_item_call.save
                render json: @call_item_call, status: :created
              else
                render json: @call_item_call.errors, status: :unprocessable_entity
              end
            else
              render json: {'error': 'The sum of the percentages of the items exceeds 100%'},
                     status: :unprocessable_entity
            end
          else
            render json: {'error': "Percentage must be less than or equal to #{@call_item_call.maximum_percentage}"},
                   status: :unprocessable_entity
          end
        else
          render json: @call_item_call.errors, status: :unprocessable_entity
        end
      end

      private

      def call_item_params
        params.require(:call_item_call).permit(:item_call_id, :percentage, :value, :maximum_percentage)
      end

      def set_call
        @call = Call.find(params[:call_id])
      end
    end
  end
end
