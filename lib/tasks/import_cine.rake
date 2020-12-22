namespace :import_cine do
  desc "Import/Create knowledge areas CINE"
  task load_data: :environment do
    require 'csv'
    require './lib/tasks/logging_util'
    include LoggingUtil
    logger_custom = LoggingUtil::LoggerCustom.new('log/task_import_cine.log')
    task_logger = logger_custom.get_logger
    superadmin_id = nil
    broad = nil
    specific = nil

    begin
      print_message('CINE - Removing old knowledge areas and reset_pk_sequence', task_logger)
      CineDetailedArea.destroy_all
      CineSpecificArea.destroy_all
      CineBroadArea.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!('cine_detailed_areas')
      ActiveRecord::Base.connection.reset_pk_sequence!('cine_specific_areas')
      ActiveRecord::Base.connection.reset_pk_sequence!('cine_broad_areas')
    rescue Exception => e
      print_error_message_and_exit("CINE - Error removing all the old knowledge areas. #{e}",
                                   task_logger)
    end

    print_message('CINE - Established or created superadmin to create Knowledge Areas', task_logger)
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

    print_message("Import/Create knowledge areas CINE - ID user #{superadmin_id}",
                  task_logger)
    CSV.foreach('lib/data/CINE_areas.csv', {:headers => [
        :codigoamplio,
        :amplio,
        :codigoespecifico,
        :especifico,
        :codigodetallado,
        :detallado]
    }
    ) do |row|
      begin
        # CINE Broad Area
        broad_code = row[:codigoamplio]
        specific_code = row[:codigoespecifico]
        if broad.nil?
          broad = CineBroadArea.create!(name: row[:amplio], code: broad_code, created_by: superadmin_id)
          print_message("\n\nCreated CINE Broad Area #{broad.name} with ID #{broad.id}", task_logger)
        elsif broad.code != broad_code
          print_message("Imported/Created CINE Broad Area #{broad.name} with ID #{broad.id} and its specifics",
                        task_logger)
          broad = CineBroadArea.create!(name: row[:amplio], code: broad_code, created_by: superadmin_id)
          print_message("\n\nCreated CINE Broad Area #{broad.name} with ID #{broad.id}", task_logger)
        end

        # CINE Specific Area
        if specific.nil?
          specific = CineSpecificArea.create!(name: row[:especifico], code: specific_code,
                                              cine_broad_area_id: broad.id, created_by: superadmin_id)
          print_message("\nCreated CINE Specific Area #{specific.name} with ID #{specific.id}", task_logger)
        elsif specific.code != specific_code
          print_message(
              "Imported/Created CINE Specific Area #{specific.name} with ID #{specific.id} and its detailed",
              task_logger)
          specific = CineSpecificArea.create!(name: row[:especifico], code: specific_code,
                                              cine_broad_area_id: broad.id, created_by: superadmin_id)
          print_message("\nCreated CINE Specific Area #{specific.name} with ID #{specific.id}", task_logger)
        end

        # CINE Detailed Area
        detailed = CineDetailedArea.create!(name: row[:detallado], code: row[:codigodetallado],
                                            cine_specific_area_id: specific.id, created_by: superadmin_id)
        print_message("Imported/Created Detailed Area #{detailed.name} with ID #{detailed.id}",
                      task_logger)
      rescue Exception => ex
        print_error_message_and_exit("Error importing/creating CINE Broad Areas. #{ex}", task_logger)
        break
      end
    end
    print_message('CINE data successfully imported!', task_logger)
  end
end
