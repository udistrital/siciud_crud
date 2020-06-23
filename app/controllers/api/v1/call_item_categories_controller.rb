module Api
  module V1
    class CallItemCategoriesController < ApplicationController
      before_action :set_call
      before_action :set_item, only: [:update, :destroy]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @call_item_category = @call.call_item_categories.order(:item_category_id)
        render json: @call_item_category, status: :ok
      end

      def create
        puts "Parametros"
        puts call_item_params
        @call_item_category = @call.call_item_categories.new(call_item_params)
        puts "Que esta pasando\n\n"
        puts @call_item_category
        budget_project = @call.maxBudgetPerProject

        if @call_item_category.valid?
          validate_percentage = CallItemCategoriesSearchService.validate_pct_less_than_maximum_pct(
              @call_item_category.percentage,
              @call_item_category.maximum_percentage)

          if validate_percentage
            # Validate add percentage not exceeding 100 %
            total_percentage = CallItemCategoriesSearchService.count_total_percentage(
                @call.call_item_categories, @call_item_category.percentage)

            if total_percentage <= 100
              @call_item_category.value = CallItemCategoriesSearchService.calculate_cash_value(
                  budget_project, @call_item_category.percentage)
              if @call_item_category.save
                render json: @call_item_category, status: :created
              else
                render json: @call_item_category.errors, status: :unprocessable_entity
              end
            else
              render json: {'error': 'The sum of the percentages of the itcall_itemems exceeds 100%'},
                     status: :unprocessable_entity
            end
          else
            render json: {'error': "Percentage must be less than or equal to #{@call_item_category.maximum_percentage}"},
                   status: :unprocessable_entity
          end
        else
          render json: @call_item_category.errors, status: :unprocessable_entity
        end
      end

      def update
        budget_project = @call.maxBudgetPerProject

        @call_item_category.value = CallItemCategoriesSearchService.calculate_cash_value(
            budget_project, @call_item_category.percentage)
        if @call_item_category.update(call_item_update_params)
          render json: @call_item_category
        else
          render json: @call_item_category.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @call_item_category.destroy
      end

      private

      def call_item_params
        params.require(:call_item_category).permit(:item_category_id, :percentage, :maximum_percentage)
      end

      def call_item_update_params
        params.require(:call_item_category).permit(:percentage, :maximum_percentage)
      end

      def set_call
        @call = Call.find(params[:call_id])
      end

      def set_item
        @call_item_category = @call.call_item_categories.find_by(id: params[:id])
        unless @call_item_category
          render json: {error: "Couldn't find call item with 'id'=#{params[:id]}"}
        end
      end
    end
  end
end
