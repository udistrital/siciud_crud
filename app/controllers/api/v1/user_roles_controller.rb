class Api::V1::UserRolesController < ApplicationController
  include Swagger::UserRoleApi

  before_action :set_user_role, only: [:show, :update]

  def index
    @user_roles = UserRole.all.order(:id)
    render json: @user_roles
  end

  def show
    render json: @user_role
  end

  def create
    @user_role = UserRole.new(user_role_params_to_create)
    if @user_role.save
      render json: @user_role, status: :created
    else
      render json: @user_role.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user_role.update(user_role_params_to_update)
      render json: @user_role
    else
      render json: @user_role.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_role
    @user_role = UserRole.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_role_params_to_create
    params.require(:user_role).permit(:name, :active, :created_by)
  end

  def user_role_params_to_update
    params.require(:user_role).permit(:name, :active, :updated_by)
  end
end
