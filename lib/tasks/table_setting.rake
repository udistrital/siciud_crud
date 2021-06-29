namespace :table_setting do
  require './lib/tasks/logging_util'
  desc "Table Setting: Reset pk sequence"
  task reset_pk_seq_all_tables: :environment do
    include LoggingUtil
    logger_custom = LoggingUtil::LoggerCustom.new('log/task_reset_pk_seq_all_tables.log')
    task_logger = logger_custom.get_logger

    ActiveRecord::Base.connection.tables.each do |t|
      if t != 'schema_migrations'
        last_pk = ActiveRecord::Base.connection.reset_pk_sequence!(t)
        print_message("Reset_pk_seq of #{t}, last pk: #{last_pk}", task_logger)
      end
    end
  end

  task reset_pk_seq_roles_table: :environment do
    include LoggingUtil
    logger_custom = LoggingUtil::LoggerCustom.new('log/task_reset_pk_seq_roles_table.log')
    task_logger = logger_custom.get_logger

    last_pk = ActiveRecord::Base.connection.reset_pk_sequence!('roles')
    print_message("Reset_pk_seq of roles table, last pk: #{last_pk}", task_logger)
  end
end
