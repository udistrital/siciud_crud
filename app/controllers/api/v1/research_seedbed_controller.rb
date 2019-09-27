module Api
  module V1
    class ResearchSeedbedController < ApplicationController
      before_action :set_research_seedbed, only: [:show, :update, :attach]

      #Manejo de excepciones de la database
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def index
        @research_seedbeds = ResearchSeedbed.all
        #Director .members.where("role_id='1'")
        #if params[:search].present? && !params[:search].nil?
        #Se envia al servicio de busqueda para flitrar los semilleros segun los parametros
        @research_seedbeds = ResearchSeedbedsSearchService.search(@research_seedbeds, params[:name], params[:director], params[:facultyid])
        #end
        #Se envian los semilleros en formato JSON paginados de a 10 elementos por pagina
        paginate json: @research_seedbeds.includes(:faculties, :curricular_projects, :research_focuses,
                                                   :state_seedbed, :snies, :cidcActDocument_attachment, :facultyActDocument_attachment),
                 each_serializer: ResearchSeedbedSimpleSerializer
      end

      def show
        #Se muestra en detalle un semillero de investigacion segun un ID que se envia en el get
        render json: @research_seedbed
      end

      def create
        #Crear el semillero de investigacion con los parametros que se envian
        @research_seedbed = ResearchSeedbed.new(research_seedbed_params)
        @research_seedbed.curricular_project_ids = (params[:research_seedbed][:curricular_project_ids]).uniq
        #if (faculties = research_seedbed_params[:faculty_ids])
        #Revisar si se enviaron facultades  y añadirselas al semillero (relacion muchos a muchos)
        #faculties = faculties.split(',')
        #@research_seedbed.faculty_ids = faculties
        #end
        #Revisar si se enviaron Lienas de investigacion  y añadirselas al semillero (relacion muchos a muchos)
        # if (research_focus_ids = research_seedbed_params[:research_focus_ids])
        #   research_focus_ids = research_focus_ids.split(",")
        #   @research_seedbed.research_focus_ids = research_focus_ids
        # end
        # #Revisar si se enviaron projec  y añadirselas al semillero (relacion muchos a muchos)
        # if (curricular_project_ids = research_seedbed_params[:curricular_project_ids])
        #   curricular_project_ids = curricular_project_ids.split(",")
        #   @research_seedbed.curricular_project_ids = curricular_project_ids

        # end
        setFaculties
        #Se intenta guardar el semillero
        if @research_seedbed.save
          render json: @research_seedbed, status: :created
        else
          #En caso de no poder guardar se muestra el error
          render json: @research_seedbed.errors, status: :unprocessable_entity
        end
      end

      def update
        #Se intenta actualizar el semillero con la informacion enviada en los parametros
        if @research_seedbed.update(research_seedbed_params)
          #byebug
          @research_seedbed.curricular_project_ids = (params[:research_seedbed][:curricular_project_ids]).uniq
          #Se actualizan si se enviaron facultades  y añadirselas al semillero (relacion muchos a muchos)
          #if(faculties = research_seedbed_params[:faculty_ids])
          #faculties = faculties.split(',')
          #@research_seedbed.faculty_ids = faculties
          #end
          #Se actualizan si se enviaron facultades  y añadirselas al semillero (relacion muchos a muchos)
          # if (research_focus_ids = research_seedbed_params[:research_focus_ids])
          #   research_focus_ids = research_focus_ids.split(",")
          #   @research_seedbed.research_focus_ids = research_focus_ids
          # end
          # #Se actualizan si se enviaron facultades  y añadirselas al semillero (relacion muchos a muchos)
          # if (curricular_project_ids = research_seedbed_params[:curricular_project_ids])
          #   curricular_project_ids = curricular_project_ids.split(",")
          #   @research_seedbed.curricular_project_ids = curricular_project_ids
          # end
          setFaculties
          #Se intenta actualizar el semillero de investigacion con las facultades en caso de que no se pueda envia error
          if @research_seedbed.save
            render json: @research_seedbed
          else
            render json: @research_seedbed.errors, status: :unprocessable_entity
          end
        else
          render json: @research_seedbed.errors, status: :unprocessable_entity
        end
      end

      def attach
        #Añadir los documentos de Facultad y de CIDC

        params.permit(:facultyActDocument, :cidcActDocument)
        if (params[:facultyActDocument])
          if (params[:facultyActDocument].content_type == "application/pdf")
            @research_seedbed.facultyActDocument.attach(params[:facultyActDocument])
          else
            return render json: { "error": "El acta de facultad debe ser de formato pdf" }, status: :unprocessable_entity
          end
        end
        if (params[:cidcActDocument])
          if (params[:cidcActDocument].content_type == "application/pdf")
            @research_seedbed.cidcActDocument.attach(params[:cidcActDocument])
          else
            return render json: { "error": "El acta del cidc debe ser de formato pdf" }, status: :unprocessable_entity
          end
        end
      end

      private

      def setFaculties
        @research_seedbed.faculties.clear
        faculties = []
        @research_seedbed.curricular_projects.each do |curricular_project|
          if !@research_seedbed.faculties.exists?(id: curricular_project.faculty.id)
            #byebug
            faculties.push(curricular_project.faculty.id)
            #@research_seedbed.faculties << curricular_project.faculty
          end
        end
        @research_seedbed.faculty_ids = faculties.uniq
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_research_seedbed
        @research_seedbed = ResearchSeedbed.find(params[:id])
      end

      # Lista de parametros permitidos
      def research_seedbed_params
        params.require(:research_seedbed).permit(:name, :acronym, :description, :cidcRegistrationDate,
                                                 :cidcActNumber, :facultyActNumber, :facultyRegistrationDate, :state_seedbed_id,
                                                 :snies_id, :email, :webpage, :mission, :vision, :facultyActDocument, :cidcActDocument,
                                                 research_focus_ids: [], curricular_project_ids: [])
      end
    end
  end
end
