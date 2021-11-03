module Api
  module V1
    class HistContactsController < ApplicationController
      include Swagger::HistContactApi

      before_action :set_dependency, only: [:create]
      before_action :set_hist_contact, only: [:show, :update]

      # GET /hist_contacts
      def index
        @hist_contacts = CompleteHistContact.where(
          "dependency_id = ?", params[:dependency_id]
        )

        @hist_contacts = DxService.load(@hist_contacts,
                                        params)
        render json: @hist_contacts
      end

      # GET /hist_contacts/1
      def show
        render json: @hist_contact
      end

      # POST /hist_contacts
      def create
        @hist_contact = @dependency.hist_contacts.new(
          hist_contact_params_to_create)

        filter = "dependency_id = #{params[:dependency_id]} AND is_current = true"
        if HistoricalService.has_current(HistContact, filter)
          HistoricalService.remove_current(HistContact, filter)
        end

        if @hist_contact.save
          render json: @hist_contact, status: :created
        else
          render json: @hist_contact.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /hist_contacts/1
      def update
        if @hist_contact.update(hist_contact_params_to_update)
          render json: @hist_contact
        else
          render json: @hist_contact.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_hist_contact
        @hist_contact = HistContact.find(params[:id])
      end

      def set_dependency
        @dependency = Dependency.find(params[:dependency_id])
      end

      # Only allow a trusted parameter "white list" through.
      def hist_contact_params_to_create
        params.require(:hist_contact).permit(:contact_id,
                                             :is_current, :active,
                                             :created_by)
      end

      def hist_contact_params_to_update
        params.require(:hist_contact).permit(:contact_id, :dependency_id,
                                             :is_current, :active,
                                             :updated_by)
      end
    end
  end
end