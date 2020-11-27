require 'csv'
namespace :import_oecd do
  desc "Import/Create knowledge areas OECD"
  task load_data: :environment do
    task_logger = Logger.new('log/task_import_oecd.log')
    task_logger.level = Logger::DEBUG
    task_logger.datetime_format = "%Y-%m-%d %H:%M:%S"
    superadmin_id = nil
    area = nil
    subarea = nil

    begin
      print_message('Removing old knowledge areas and reset_pk_sequence', task_logger)
      OecdDiscipline.destroy_all
      OecdKnowledgeSubarea.destroy_all
      OecdKnowledgeArea.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!('oecd_disciplines')
      ActiveRecord::Base.connection.reset_pk_sequence!('oecd_knowledge_subareas')
      ActiveRecord::Base.connection.reset_pk_sequence!('oecd_knowledge_areas')
    rescue Exception => e
      print_error_message_and_exit("Error removing all the old knowledge areas. #{e}",
                                   task_logger)
    end

    print_message('Established or created superadmin to create Knowledge Areas', task_logger)
    begin
      superadmin = User.where(user_role_id: 1, identification_number: '1234567890',
                              oas_user_id: nil).limit(1)[0]
      if superadmin.nil?
        superadmin = User.create!(user_role_id: 1, identification_number: '1234567890')
      end
      superadmin_id = superadmin.id
    rescue ActiveRecord::RecordInvalid => e_ri
      print_error_message_and_exit("Error creating or validating superadmin. #{e_ri}",
                                   task_logger)
    rescue Exception => e
      print_error_message_and_exit("Error creating or validating superadmin. #{e}",
                                   task_logger)
    end

    print_message("Import/Create knowledge areas OECD - ID user #{superadmin_id}",
                  task_logger)
    CSV.foreach('lib/data/OCDE_areas.csv', {:headers => [
        :codigoarea,
        :area,
        :codigosubarea,
        :subarea,
        :codigodisciplina,
        :disciplina]
    }
    ) do |row|
      begin
        # Knowledge area
        area_code = row[:codigoarea]
        subarea_code = row[:codigosubarea]
        if area.nil?
          area = OecdKnowledgeArea.create!(name: row[:area], code: area_code, created_by: superadmin_id)
          print_message("\n\nCreated Knowledge Area #{area.name} with ID #{area.id}", task_logger)
        elsif area.code != area_code
          print_message("Imported/Created Knowledge Area #{area.name} with ID #{area.id} and its subareas",
                        task_logger)
          area = OecdKnowledgeArea.create!(name: row[:area], code: area_code, created_by: superadmin_id)
          print_message("\n\nCreated Knowledge Area #{area.name} with ID #{area.id}", task_logger)
        end

        # knowledge subareas and disciplines from area
        if subarea.nil?
          subarea = OecdKnowledgeSubarea.create!(name: row[:subarea], code: subarea_code,
                                                 oecd_knowledge_area_id: area.id, created_by: superadmin_id)
          print_message("\nCreated Knowledge Subarea #{subarea.name} with ID #{subarea.id}", task_logger)
        elsif subarea.code != subarea_code
          print_message("Imported/Created Knowledge Subarea #{subarea.name} with ID #{subarea.id} and its disciplines",
                        task_logger)
          subarea = OecdKnowledgeSubarea.create!(name: row[:subarea], code: subarea_code,
                                                 oecd_knowledge_area_id: area.id, created_by: superadmin_id)
          print_message("\nCreated Knowledge Subarea #{subarea.name} with ID #{subarea.id}", task_logger)
        end
        discipline = OecdDiscipline.create!(name: row[:disciplina], code: row[:codigodisciplina],
                               oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
        print_message("Imported/Created Discipline #{discipline.name} with ID #{discipline.id} and its subareas",
                      task_logger)
      rescue Exception => ex
        print_error_message_and_exit("Error importing/creating knowledge areas. #{ex}", task_logger)
        break
      end
    end
    print_message('OECD data successfully imported!', task_logger)

      # begin
      #   ###########################################################################
      #   #                       Knowledge area 1                                  #
      #   ###########################################################################
      #   area = OecdKnowledgeArea.create!(name: "Ciencias Naturales", code: "1", created_by: superadmin_id)
      #   # knowledge subareas and disciplines from area 1
      #   subarea = OecdKnowledgeSubarea.create!(name: "Matemática", code: "1A",
      #                                          oecd_knowledge_area_id: area.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Matemáticas puras", code: "1A01",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Matemáticas aplicadas", code: "1A02",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Estadísticas y probabilidades (Investigación en metodologías)",
      #                          code: "1A03", oecd_knowledge_subarea_id: subarea.id,
      #                          created_by: superadmin_id)
      #
      #   subarea = OecdKnowledgeSubarea.create!(name: "Computación y Ciencias de la Información", code: "1B",
      #                                          oecd_knowledge_area_id: area.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ciencias de la computación", code: "1B01",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(
      #       name: "Ciencias de la información y bioinformática (hardware en 2,b y aspectos sociales en 5,8",
      #       code: "1B02", oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #
      #   subarea = OecdKnowledgeSubarea.create!(name: "Ciencias Físicas", code: "1C",
      #                                          oecd_knowledge_area_id: area.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Física atómica, molecular y química", code: "1C01",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Física de la materia", code: "1C02",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Física de partículas y campo", code: "1C03",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Física nuclear", code: "1C04",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Física de plasmas y fluidos", code: "1C05",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Óptica", code: "1C06",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Acústica", code: "1C07",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Astronomía", code: "1C08",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #
      #   subarea = OecdKnowledgeSubarea.create!(name: "Ciencias Químicas", code: "1D",
      #                                          oecd_knowledge_area_id: area.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Química orgánica", code: "1D01",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Química inorgánica y nuclear", code: "1D02",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Química física", code: "1D03",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ciencias de los polímeros", code: "1D04",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Electroquímica", code: "1D05",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Química de los coloides", code: "1D06",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Química analítica", code: "1D07",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #
      #   subarea = OecdKnowledgeSubarea.create!(name: "Ciencias de la Tierra y Medioambientales", code: "1E",
      #                                          oecd_knowledge_area_id: area.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Geociencias (multidisciplinario)", code: "1E01",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Mineralogía", code: "1E02",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Paleontología", code: "1E03",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Geoquímica y geofísica", code: "1E04",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Geografía física", code: "1E05",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Geología", code: "1E06",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Vulcanología", code: "1E07",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ciencias del medio ambiente (aspectos sociales en 5.G)",
      #                          code: "1E08",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Meteorología y ciencias atmosféricas", code: "1E09",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Investigación del clima", code: "1E10",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Oceanografía, hidrología y recursos del agua", code: "1E11",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #
      #   subarea = OecdKnowledgeSubarea.create!(name: "Ciencias Biológicas", code: "1F",
      #                                          oecd_knowledge_area_id: area.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Biología celular y microbiología", code: "1F01",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Virología", code: "1F02",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Bioquímica y biología molecular", code: "1F03",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Métodos en investigación en bioquímica", code: "1F04",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Micología", code: "1F05",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Biofísica", code: "1F06",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Genética y herencia (aspectos médicos en 3)", code: "1F07",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Biología reproductiva (aspectos médicos en 3)",
      #                          code: "1F08",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Biología del desarrollo", code: "1F09",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Botánica y ciencias de las plantas", code: "1F10",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(
      #       name: "Zoología, Ornitología, Entomología, ciencias biológicas del comportamiento",
      #       code: "1F11", oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Biología marina y del agua", code: "1F12",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ecología", code: "1F13",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Conservación de la biodiversidad", code: "1F14",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Biología (Teoría, matemática, criobiología, evolutiva)",
      #                          code: "1F15",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Otras biologías", code: "1F16",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #
      #   subarea = OecdKnowledgeSubarea.create!(name: "Otras Ciencias naturales", code: "1G",
      #                                          oecd_knowledge_area_id: area.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Otras ciencias naturales", code: "1G01",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   print_message("Imported/Created Knowledge Area #{area.name} with ID #{area.id} and its subareas",
      #                 task_logger)
      #
      #
      #   ###########################################################################
      #   #                       Knowledge area 2                                  #
      #   ###########################################################################
      #   area = OecdKnowledgeArea.create!(name: "Ingeniería y Tecnología", code: "2", created_by: superadmin_id)
      #   # knowledge subareas and disciplines from area 2
      #   subarea = OecdKnowledgeSubarea.create!(name: "Ingeniería Civil", code: "2A",
      #                                          oecd_knowledge_area_id: area.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ingeniería civil", code: "2A01",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ingeniería arquitectónica", code: "2A02",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ingeniería de la construcción", code: "2A03",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ingeniería estructural y municipal", code: "2A04",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ingeniería de transporte", code: "2A05",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #
      #   subarea = OecdKnowledgeSubarea.create!(name: "Ingenierías Eléctrica, Electrónica e informática",
      #                                          code: "2B",
      #                                          oecd_knowledge_area_id: area.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ingeniería eléctrica y electrónica", code: "2B01",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Robótica y control automático", code: "2B02",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Automatización y sistemas de control", code: "2B03",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ingeniería de sistemas y comunicaciones", code: "2B04",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Telecomunicaciones", code: "2B05",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Hardware y arquitectura de computadores", code: "2B06",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #
      #   subarea = OecdKnowledgeSubarea.create!(name: "Ingeniería Mecánica", code: "2C",
      #                                          oecd_knowledge_area_id: area.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ingeniería mecánica", code: "2C01",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Mecánica aplicada", code: "2C02",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Termodinámica", code: "2C03",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ingeniería aeroespacial", code: "2C04",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ingeniería nuclear (física nuclear en 1.C)", code: "2C05",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #   OecdDiscipline.create!(name: "Ingeniería del audio", code: "2C06",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      #
      #
      #   OecdDiscipline.create!(name: "Reemplazar", code: "2X0X",
      #                          oecd_knowledge_subarea_id: subarea.id, created_by: superadmin_id)
      # rescue Exception => ex
      #   print_error_message_and_exit("Error importing/creating knowledge areas. #{ex}", task_logger)
      # end
  end

  def print_message(msg, task_logger)
    task_logger.debug msg
    puts msg
  end

  def print_error_message_and_exit(msg, task_logger)
    task_logger.error msg
    puts msg
    task_logger.debug "Task stopped!!!\n\n"
    puts "Task stopped!!!\n\n"
    exit
  end
end
