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
