class Api::V1::FeContactController < ApplicationController
  include Swagger::FeContactApi

  before_action :set_funding_entity
  before_action :set_fe_contact, only: [:show, :update]

  def index
    #Listar todos los convenios
    @fe_contacts = @funding_entity.fe_contacts
    paginate json: @fe_contacts
  end

  def show
    render json: @fe_contact
  end

  def create
    @fe_contact = @funding_entity.fe_contacts.new(fe_contact_params)
    if @fe_contact.save
      render json: @fe_contact, status: :created
    else
      render json: @fe_contact.errors, status: :unprocessable_entity
    end
  end

  def update
    if @fe_contact.update(fe_contact_params)
      render json: @fe_contact
    else
      render json: @fe_contact.errors, status: :unprocessable_entity
    end
  end

  private

  def set_fe_contact
    @fe_contact = @funding_entity.fe_contacts.find_by(id: params[:id])
  end

  def fe_contact_params
    params.require(:fe_contact).permit(:name, :lastName, :phoneNumber, :mobileNumber, :role, :email)
  end

  def set_funding_entity
    @funding_entity = FundingEntity.find(params[:funding_entity_id])
  end
end
