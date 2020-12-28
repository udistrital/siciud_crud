module LoggingUtil
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

  class LoggerCustom

    def initialize(file_path)
      @task_logger = Logger.new('log/task_import_cine.log')
      @task_logger.level = Logger::DEBUG
      @task_logger.datetime_format = "%Y-%m-%d %H:%M:%S"
    end

    def get_logger
      @task_logger
    end
  end
end