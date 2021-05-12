namespace :import_geos do
  desc "TODO"
  task load_data: :environment do
    require 'csv'
    require './lib/tasks/logging_util'
    include LoggingUtil
    logger_custom = LoggingUtil::LoggerCustom.new('log/task_import_geos.log')
    task_logger = logger_custom.get_logger
    superadmin_id = nil
    country = nil
    state = nil

    begin
      print_message('GEOS - Removing old geos and reset_pk_sequence', task_logger)
      GeoCity.destroy_all
      GeoState.destroy_all
      GeoCountry.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!('geo_cities')
      ActiveRecord::Base.connection.reset_pk_sequence!('geo_states')
      ActiveRecord::Base.connection.reset_pk_sequence!('geo_countries')
    rescue Exception => e
      print_error_message_and_exit("GEOS - Error removing all the old geos. #{e}",
                                   task_logger)
    end

    print_message('GEOS - Established or created superadmin to create Geos', task_logger)
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

    print_message("Import/Create GEOS - ID user #{superadmin_id}",
                  task_logger)
    CSV.foreach('lib/data/geos.csv', { :headers => [
      :gc_name,
      :iso2,
      :iso3,
      :capital_name,
      :currency,
      :gs_name,
      :st_code,
      :city_name,
      :city_code,
      :latitude,
      :longitude]
    }
    ) do |row|
      begin
        # GEO Country
        country_name = row[:gc_name]
        state_name = row[:gs_name]
        if country.nil?
          country = GeoCountry.create!(name: country_name,
                                       iso2: row[:iso2],
                                       iso3: row[:iso3],
                                       capital_name: row[:capital_name],
                                       currency: row[:currency],
                                       created_by: superadmin_id)
          print_message("\n\nCreated Geo Country #{country.name} with ID #{country.id}", task_logger)
        elsif country.name != country_name
          print_message("Imported/Created Geo Country #{country.name} with ID #{country.id} and its states",
                        task_logger)
          country = GeoCountry.create!(name: country_name,
                                       iso2: row[:iso2],
                                       iso3: row[:iso3],
                                       capital_name: row[:capital_name],
                                       currency: row[:currency],
                                       created_by: superadmin_id)
          print_message("\n\nCreated Geo Country #{country.name} with ID #{country.id}", task_logger)
        end

        # GEO State
        if state.nil?
          state = GeoState.create!(name: state_name,
                                   code: row[:st_code],
                                   geo_country_id: country.id,
                                   created_by: superadmin_id)
          print_message("\nCreated Geo State #{state.name} with ID #{state.id}", task_logger)
        elsif state.code != state_name
          print_message(
            "Imported/Created Geo State #{state.name} with ID #{state.id} and its cities",
            task_logger)
          state = GeoState.create!(name: state_name,
                                   code: row[:st_code],
                                   geo_country_id: country.id,
                                   created_by: superadmin_id)
          print_message("\nCreated Geo State #{state.name} with ID #{state.id}", task_logger)
        end

        # GEO City
        city = GeoCity.create!(name: row[:city_name],
                               code: row[:city_code],
                               latitude: row[:latitude],
                               longitude: row[:longitude],
                               geo_state_id: state.id,
                               created_by: superadmin_id)
        print_message("Imported/Created Geo City #{city.name} with ID #{city.id}",
                      task_logger)
      rescue Exception => ex
        print_error_message_and_exit("Error importing/creating GEO Country. #{ex}", task_logger)
        break
      end
    end
    print_message('GEOS data successfully imported!', task_logger)

  end

end
