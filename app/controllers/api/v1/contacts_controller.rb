module Api
  module V1
    class ContactsController < ApplicationController
      before_action :set_contact, only: [:show, :update]

      # GET /contacts
      def index
        @contacts = Contact.all
        @contacts = DxService.load(@contacts, params)
        render json: @contacts
      end

      # GET /contacts/1
      def show
        render json: @contact
      end

      # POST /contacts
      def create
        @contact = Contact.new(contact_params_to_create)

        if @contact.save
          render json: @contact, status: :created
        else
          render json: @contact.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /contacts/1
      def update
        if @contact.update(contact_params_to_update)
          render json: @contact
        else
          render json: @contact.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def contact_params_to_create
        params.require(:contact).permit(:name, :email,
                                        :phone, :active,
                                        :created_by)
      end

      def contact_params_to_update
        params.require(:contact).permit(:name, :email,
                                        :phone, :active,
                                        :updated_by)
      end
    end
  end
end