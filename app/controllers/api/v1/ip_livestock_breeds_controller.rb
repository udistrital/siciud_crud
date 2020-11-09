module Api
  module V1
    class IpLivestockBreedsController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_ip_livestock_breed, only: [:show, :update, :attach]

      # GET /research_group/:id/ip_livestock_breeds
      def index
        @ip_livestock_breeds = @research_group.ip_livestock_breeds
        render json: @ip_livestock_breeds
      end

      # GET /research_group/:id/ip_livestock_breeds/1
      def show
        render json: @ip_livestock_breed
      end

      # POST /research_group/:id/ip_livestock_breeds
      def create
        @ip_livestock_breed = @research_group.ip_livestock_breeds.new(ip_livestock_breed_params)

        if @ip_livestock_breed.save
          render json: @ip_livestock_breed, status: :created
        else
          render json: @ip_livestock_breed.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/ip_livestock_breeds/1
      def update
        if @ip_livestock_breed.update(ip_livestock_breed_params)
          render json: @ip_livestock_breed
        else
          render json: @ip_livestock_breed.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/ip_livestock_breeds/1/attach
      def attach
        params.permit(:certificate_ma_document, :ip_livestock_breed_document)
        if (file = params[:certificate_ma_document])
          if file.content_type == "application/pdf"
            @ip_livestock_breed.certificate_ma_document.attach(file)
          else
            return render json: {'error': 'El certificado MA debe ser formato pdf.'},
                          status: :unprocessable_entity
          end
        end

        if (file = params[:ip_livestock_breed_document])
          if file.content_type == "application/pdf"
            @ip_livestock_breed.ip_livestock_breed_document.attach(file)
          else
            return render json: {'error': 'El documento MA debe ser formato pdf.'},
                          status: :unprocessable_entity
          end
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_ip_livestock_breed
        @ip_livestock_breed = @research_group.ip_livestock_breeds.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ip_livestock_breed_params
        params.require(:ip_livestock_breed).permit(:name, :publication_date,
                                                   :consecutive_number_ma,
                                                   :observation, :category_id,
                                                   :geo_city_id)
      end
    end
  end
end
