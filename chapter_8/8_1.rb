describe 'LogTest' do
  let (:logger) {Logger.get_logger} # Notice we are calling this on self; not an instance of the Logger class.
  let (:logger_without_appenders) {Logger.new.remove_all_appenders}
  let (:root_logger) {Logger.get_root_logger}
  let (:root_logger_without_appenders) {root_logger.remove_all_appenders}

  it 'has a basic logger' do 
    BasicConfigurator.configure 
    logger.info.should == "basic_logger"
  end

  it 'adds an appender with stream' do 
    logger.add_appender
    ConsoleAppender.new
    PatternLayout.new("%p %t %m%n")
    ConsoleAppender.system_out

    logger.info.should == "add_appender_with_stream"
  end

  it 'adds an appender without stream' do 
    logger.add_appender
    ConsoleAppender.new
    PatternLayout.new("%p %t %m%n")

    logger.info.should == "add_appender_without_stream"
  end
end

class Logger
  def self.get_logger
  end

  def remove_all_appenders
  end

  def self.get_root_logger
  end

  def self.remove_all_appenders
  end

  # additional methods methods
end