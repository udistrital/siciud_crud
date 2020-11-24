module Api
  module V1
    class UsersController < ApplicationController
      before_action only: [:create, :update] do
        validate_created_by(user_params)
        validate_updated_by(user_params)
      end
      before_action :set_user, only: [:show, :update]
      #User.joins(:user_roles).where("user_roles.id = 4").first.researcher.mail

      rescue_from Exception do |e|
        render json: {error: e.message}, status: :internal_error
      end

      # GET /users
      def index
        @users = User.all
        if (user_id = params[:identification_number])
          @users = User.where("users.identification_number = '#{user_id}'")
        end

        render json: @users
      end

      # GET /users/1
      def show
        render json: @user
      end

      # POST /users
      def create
        @user = User.new(user_params)
        @user.active = true

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.created_by.nil?
          # Update user of created_by only this is nil
          if @user.update(user_params)
            render json: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        else
          if @user.update(user_params.except(:created_by))
            render json: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
      end


      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(:identification_number, :oas_user_id,
                                     :user_role_id, :active,
                                     :created_by, :updated_by)
      end
    end
  end
end