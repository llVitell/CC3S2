require 'logger'

module ControllerLogger
  # Si no estás utilizando un framework que te brinde funcionalidad de logging
  # de forma predeterminada, es una buena idea implementar un método de logging
  # centralizado en la clase base para tener un logging consistente y evitar
  # imprimir logs durante las pruebas

  def self.prepended(parent_class)
    parent_class.instance_eval do
      def self.inherited(klass)
        klass.send(:prepend, ControllerLogger)
      end
    end
  end

  def initialize(voting_machine)
    super
    @logger = Logger.new('logfile.log') # Cambia 'logfile.log' al nombre del archivo de log que desees
    @logger.level = Logger::DEBUG
  end

  def log(msg)
    timestamped_msg = "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] #{msg}"
    log_to_file(timestamped_msg)
    @logger.debug(msg)
  end

  def log_to_file(msg, level = 'debug')
    @logger.send(level, msg)
  end

  def run
    log "Starting #{self.class}" if ENV['DEBUG']
    return_val = super
    log "Completed running #{self.class}" if ENV['DEBUG']
    return return_val
  end
end
