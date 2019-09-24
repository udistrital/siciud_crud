module Api
  module V1
    class AgreementController < ApplicationController
      include Swagger::AgreementApi

      before_action :set_agreement, only: [:show, :update, :attach]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def index
        #Listar todos los convenios
        @agreements = Agreement.all
        paginate json: @agreements
      end

      def show
        #Mostar convenio en detalles
        render json: @agreement
      end

      def create
        #Metodo para Crear  un convenio
        @agreement = Agreement.new(agreement_params)
        @agreement.registerDate = DateTime.now.in_time_zone(-5).to_date
        if @agreement.save
          render json: @agreement, status: :created
        else
          render json: @agreement.errors, status: :unprocessable_entity
        end
      end

      def update
        #Metodo para actualizar un convenio
        if @agreement.update(agreement_params)
          render json: @agreement
        else
          render json: @agreement.errors, status: :unprocessable_entity
        end
      end

      #Añadir El contrato y el acta de inicio

      def attach
        params.permit(:id, :contractDocument, :initialActDocument)
        #byebug
        if (params[:contractDocument])
          if (params[:contractDocument].content_type == "application/pdf")
            @agreement.contractDocument.attach(params[:contractDocument])

            # if (@agreement.contractDocument.filename.extension_without_delimiter != "pdf")
            #  @agreement.contractDocument.purge
          else
            return render json: { "error": "El contrato debe ser de formato pdf" }, status: :unprocessable_entity
          end
        end
        if (params[:initialActDocument])
          if (params[:initialActDocument].content_type == "application/pdf")
            @agreement.initialActDocument.attach(params[:initialActDocument])

            #if (@agreement.initialActDocument.filename.extension_without_delimiter != "pdf")
            # @agreement.initialActDocument.purge
            #            return render json: { "error": "El archivo debe ser de formato pdf" }, status: :unprocessable_entity
            #         end
          else
            return render json: { "error": "El Acta inicial debe ser de formato pdf" }, status: :unprocessable_entity
          end
        end
        render json: @agreement
      end

      private

      def set_agreement
        #Asignar el acuerdo segun el parametro de la url
        @agreement = Agreement.find(params[:id])
      end

      def agreement_params
        #Parametros permitidos para la creacion de un acuerdo
        params.require(:agreement).permit(:name, :registerDate, :startDate, :finalDate, :duration, :availability, :bizagiNumber, :description,
                                          :agreementNumber, :agreement_status_id, :agreement_type_id)
        #, research_group_ids: [])
      end
    end
  end
end
