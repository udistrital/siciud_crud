namespace :import_types_subtypes do
  desc "Import/Create/update Types and Subtypes"
  task create_data: :environment do
    require 'csv'
    require './lib/tasks/logging_util'
    include LoggingUtil
    logger_custom = LoggingUtil::LoggerCustom.new('log/task_import_new_types_subtypes.log')
    task_logger = logger_custom.get_logger
    superadmin_id = nil

    begin
      print_message('Removing types and subtypes, and reset_pk_sequence',
                    task_logger)
      Subtype.destroy_all
      Type.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!('subtypes')
      ActiveRecord::Base.connection.reset_pk_sequence!('types')
    rescue Exception => e
      print_error_message_and_exit(
        "Error removing all the types and subtypes. #{e}",
        task_logger)
    end

    print_message('Types and Subtypes - Established or created superadmin',
                  task_logger)
    begin
      superadmin = User.where(user_role_id: 1,
                              identification_number: '1234567890',
                              oas_user_id: nil).limit(1)[0]
      if superadmin.nil?
        superadmin = User.create!(user_role_id: 1,
                                  identification_number: '1234567890')
      end
      superadmin_id = superadmin.id
    rescue ActiveRecord::RecordInvalid => e_ri
      print_error_message_and_exit(
        "Error creating or validating superadmin. #{e_ri}",
        task_logger)
    rescue Exception => e
      print_error_message_and_exit(
        "Error creating or validating superadmin. #{e}",
        task_logger)
    end

    print_message("Import/Create Types - ID user #{superadmin_id}",
                  task_logger)
    CSV.foreach('lib/data/types_14042021.csv', { :headers => [
      :id,
      :t_name,
      :t_description]
    }
    ) do |row|
      begin
        type = Type.create!(id: row[:id],
                            t_name: row[:t_name],
                            t_description: row[:t_description],
                            created_by: superadmin_id)
        print_message("\n\nCreated Type #{type.t_name} with ID #{type.id}", task_logger)
      rescue Exception => ex
        print_error_message_and_exit("Error importing/creating Types. #{ex}", task_logger)
        break
      end
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('types')
    print_message('Type data successfully imported!', task_logger)

    CSV.foreach('lib/data/subtypes_14042021.csv', { :headers => [
      :id,
      :parent_id,
      :type_id,
      :st_name,
      :st_description]
    }
    ) do |row|
      begin
        subtype = Subtype.create!(id: row[:id],
                                  parent_id: row[:parent_id],
                                  type_id: row[:type_id],
                                  st_name: row[:st_name],
                                  st_description: row[:st_description],
                                  created_by: superadmin_id)
        print_message("\n\nCreated Subtype #{subtype.st_name} with ID #{subtype.id}", task_logger)
      rescue Exception => ex
        print_error_message_and_exit("Error importing/creating Subtypes. #{ex}", task_logger)
        break
      end
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('subtypes')
    print_message('Subtype data successfully imported!', task_logger)
  end

  task update_data: :environment do
    require 'csv'
    require './lib/tasks/logging_util'
    include LoggingUtil
    logger_custom = LoggingUtil::LoggerCustom.new('log/task_import_update_types_subtypes.log')
    task_logger = logger_custom.get_logger
    superadmin_id = nil

    print_message('Types and Subtypes - Established or created superadmin',
                  task_logger)
    begin
      superadmin = User.where(user_role_id: 1,
                              identification_number: '1234567890',
                              oas_user_id: nil).limit(1)[0]
      if superadmin.nil?
        superadmin = User.create!(user_role_id: 1,
                                  identification_number: '1234567890')
      end
      superadmin_id = superadmin.id
    rescue ActiveRecord::RecordInvalid => e_ri
      print_error_message_and_exit(
        "Error creating or validating superadmin. #{e_ri}",
        task_logger)
    rescue Exception => e
      print_error_message_and_exit(
        "Error creating or validating superadmin. #{e}",
        task_logger)
    end

    print_message("Import/Create Types - ID user #{superadmin_id}",
                  task_logger)
    CSV.foreach('lib/data/types_14042021.csv', { :headers => [
      :id,
      :t_name,
      :t_description]
    }
    ) do |row|
      begin
        type_exists = Type.find_by(id: row[:id])
        if type_exists.nil?
          type = Type.create!(id: row[:id],
                              t_name: row[:t_name],
                              t_description: row[:t_description],
                              created_by: superadmin_id)
          print_message("\n\nCreated Type #{type.t_name} with ID #{type.id}", task_logger)
        else
          type_upd = type_exists.update(t_name: row[:t_name],
                                        t_description: row[:t_description],
                                        updated_by: superadmin_id)
          if type_upd
            print_message("\n\nUpdated Type #{type_exists.t_name} with ID #{type_exists.id}", task_logger)
          else
            print_error_message_and_exit("Error updating Types. #{type_exists.errors}",
                                         task_logger)
          end
        end

      rescue Exception => ex
        print_error_message_and_exit("Error importing/creating/updating Types. #{ex}",
                                     task_logger)
        break
      end
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('types')
    print_message('Type data successfully imported/updated!', task_logger)

    CSV.foreach('lib/data/subtypes_14042021.csv', { :headers => [
      :id,
      :parent_id,
      :type_id,
      :st_name,
      :st_description]
    }
    ) do |row|
      begin
        subtype_exists = Subtype.find_by(id: row[:id])

        if subtype_exists.nil?
          subtype = Subtype.create!(id: row[:id],
                                    parent_id: row[:parent_id],
                                    type_id: row[:type_id],
                                    st_name: row[:st_name],
                                    st_description: row[:st_description],
                                    created_by: superadmin_id)
          print_message("\n\nCreated Subtype #{subtype.st_name} with ID #{subtype.id}", task_logger)
        else
          subtype_upd = subtype_exists.update(parent_id: row[:parent_id],
                                              type_id: row[:type_id],
                                              st_name: row[:st_name],
                                              st_description: row[:st_description],
                                              updated_by: superadmin_id)
          if subtype_upd
            print_message("\n\nUpdated Subtype #{subtype_exists.st_name} with ID #{subtype_exists.id}",
                          task_logger)
          else
            print_error_message_and_exit("Error updating Subtypes. #{subtype_exists.errors}",
                                         task_logger)
          end
        end
      rescue Exception => ex
        print_error_message_and_exit("Error importing/creating/updating Subtypes. #{ex}",
                                     task_logger)
        break
      end
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('subtypes')
    print_message('Subtype data successfully imported/updated!', task_logger)
  end
end
